import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/grocery_tile.dart';
import 'package:flutter_app/models/grocery_item.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class GroceryItemScreen extends StatefulWidget{
  late final Function(GroceryItem)? onCreate;
  late final Function(GroceryItem)? onUpdate;
  late final GroceryItem? originalItem;
  late final bool isUpdating;

  GroceryItemScreen( {Key? key, this.onCreate, this.onUpdate, this.originalItem,}): isUpdating = (originalItem != null),
        super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _GroceryItemScreenState();
  }

}

class _GroceryItemScreenState extends State<GroceryItemScreen>{
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.green;
  int _currentSliderValue = 0;

  @override
  void initState() {
    if (widget.originalItem != null) {
      _nameController.text = widget.originalItem!.name;
      _currentSliderValue = widget.originalItem!.quantity!;
      _importance = widget.originalItem!.importance!;
      _currentColor = widget.originalItem!.color!;
      final date = widget.originalItem!.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// 2
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              final groceryItem = GroceryItem(
                id: widget.originalItem?.id ?? Uuid().v1(),
                name: _nameController.text,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                date: DateTime(_dueDate.year, _dueDate.month, _dueDate.day, _timeOfDay.hour, _timeOfDay.minute,),
              );
              if (widget.isUpdating) {
                widget.onUpdate!(groceryItem);
              } else {
                widget.onCreate!(groceryItem);
              }
            },
          ),
        ],
        title: Text('Grocery Item'
        ),
      ),
// 5
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ///Name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Item Name', style: TextStyle(fontSize: 25),),
                TextField(
                  controller: _nameController,
                  cursorColor: _currentColor,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(
                    hintText: 'E.g. Apples, Banana, 1 Bag of salt',
                    hintStyle: TextStyle(color: Colors.black12),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:  _currentColor),),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: _currentColor),),
                  ),
                ),
              ],
            ),

            ///Importance selection
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Importance', style: TextStyle(fontSize: 25),),
                Wrap(
                  spacing: 10.0,
                  children: [
                    ChoiceChip(
                      selectedColor: Colors.black,
                      selected: _importance == Importance.low,
                      label: const Text('low' ,
                        style: TextStyle(color: Colors.white),
                      ),
                      onSelected: (selected) {
                        setState(() => _importance = Importance.low);
                      },
                    ),
                    ChoiceChip(
                      selectedColor: Colors.black,
                      selected: _importance == Importance.medium,
                      label: const Text( 'medium',
                        style: TextStyle(color: Colors.white),
                      ),
                      onSelected: (selected) {
                        setState(() => _importance =Importance.medium);
                      },
                    ),
                    ChoiceChip(
                      selectedColor: Colors.black,
                      selected: _importance == Importance.high,
                      label: const Text('high',
                        style: TextStyle(color: Colors.white),),
                      onSelected: (selected) {
                        setState(() => _importance =Importance.high);
                      },
                    ),
                  ],
                ),
              ],
            ),

            ///Date picker
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Date',
                      style: TextStyle(fontSize: 25),),

                    FlatButton(
                      onPressed: () async{
                        final currentDate  = DateTime.now();
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: currentDate,
                          firstDate: currentDate,
                          lastDate: DateTime(currentDate.year+5),
                        );
                        setState(() {
                          if (selectedDate!=null){
                            _dueDate = selectedDate;
                          }
                        });
                      },
                      child: Text('Select'),
                    ),
                  ],
                ),
                if (_dueDate!=null)
                  Text('${DateFormat("yyyy-MM-dd").format(_dueDate)}'),
              ],
            ),

            /// Time picker
            SizedBox(height: 20,),
            buildTimeField(context),

            /// Color picker
            SizedBox(height: 20,),
            buildColorPicker(context),
            ///Slider
            SizedBox(height: 20,),
            buildQuantityField(),

            ///Grocery Tile
            const SizedBox(height: 16),
            GroceryTile(
              item: GroceryItem(
                name: _name,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                date: DateTime(_dueDate.year, _dueDate.month, _dueDate.day, _timeOfDay.hour, _timeOfDay.minute,
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget buildTimeField(BuildContext context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Time of Day', style: TextStyle(fontSize: 25.0),),
              FlatButton(
                child: const Text('Select'),
                onPressed: () async {
                  final timeOfDay = await showTimePicker(
                    initialTime: TimeOfDay.now(),
                    context: context,
                  );
                  setState(() {
                    if (timeOfDay != null) {
                      _timeOfDay = timeOfDay;
                    }
                  });
                },),
            ]),
        if (_timeOfDay != null)
          Text('${_timeOfDay.format(context)}'
          ),
      ],
    );
  }

  Widget buildColorPicker(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 10,
              color: _currentColor,
            ),
            const SizedBox(width: 10,),
            Text("Color", style: TextStyle(fontSize: 25),),
          ],
        ),

        FlatButton(
          child: const Text("Select Color"),
          onPressed: (){
            showDialog(context: context,
                builder: (context){
                  return AlertDialog(
                    content: BlockPicker(
                      pickerColor: Colors.white,
                      onColorChanged: (color){
                        setState(()=> _currentColor = color);
                      },
                    ),
                    actions: [
                      FlatButton(
                        onPressed: (){Navigator.of(context).pop();},
                        child: Text("Save"),
                      ),
                    ],
                  );
                }
            );
          },
        ),
      ],
    );
  }

  Widget buildQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // crossAxisAlignment: CrossAxisAlignment.baseline,
          children: [
            Text(
              'Quantity',
              style: TextStyle(fontSize: 25.0),),
            const SizedBox(width: 16.0),
            Text(
              _currentSliderValue.toInt().toString(),
              style: TextStyle(fontSize: 25.0),),
          ],
        ),
        Slider(
          inactiveColor: _currentColor.withOpacity(0.5),
          activeColor: _currentColor,
          value: _currentSliderValue.toDouble(),
          min: 0.0,
          max: 100.0,
          divisions: 100,
          label: _currentSliderValue.toInt().
          toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value.toInt();
            },
            );
          },
        ),
      ],
    );
  }

}