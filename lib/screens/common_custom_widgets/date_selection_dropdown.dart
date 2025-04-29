import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import 'colors.dart';

class SelectDateRangeDropdown extends StatefulWidget {
  final Function(DateTime? startDate, DateTime? endDate) onDateRangeSelected;

  const SelectDateRangeDropdown({
    super.key,
    required this.onDateRangeSelected,
  });

  @override
  State<SelectDateRangeDropdown> createState() =>
      _SelectDateRangeDropdownState();
}

class _SelectDateRangeDropdownState extends State<SelectDateRangeDropdown> {
  bool _isDropdownOpen = false;
  String _selectedOption = 'Select Date Range';
  DateTime? _startDate;
  DateTime? _endDate;
  bool _showCalendar = false;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedStartDay;
  DateTime? _selectedEndDay;

  int _currentMonth = 0; // 0 = current month, 1 = next month


  final GlobalKey _dropdownKey = GlobalKey();


  OverlayEntry? _overlayEntry;

  @override
  void dispose() {

    _overlayEntry?.remove();
    _overlayEntry = null;
    super.dispose();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
    setState(() {
      _isDropdownOpen = false;
    });
  }

  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _removeOverlay();
    } else {
      _showDropdown();
    }
  }

  void _showDropdown() {
    final RenderBox renderBox =
        _dropdownKey.currentContext!.findRenderObject() as RenderBox;
    final Size size = renderBox.size;
    final Offset position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [

          Positioned.fill(
            child: GestureDetector(
              onTap: _removeOverlay,
              behavior: HitTestBehavior.opaque,
              child: Container(color: Colors.transparent),
            ),
          ),

          Positioned(
            left: position.dx,
            top: position.dy + size.height,
            width: size.width,
            child: Material(
              elevation: 4.0,
              borderRadius: BorderRadius.circular(4),
              color: CustomColors.whiteColor,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: _showCalendar ? 480 : 300,
                  maxWidth: 500,
                ),
                child: _showCalendar
                    ? buildCalendarView()
                    : buildOptionsListView(),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() {
      _isDropdownOpen = true;
    });
  }

  void _selectDateOption(String option) {
    setState(() {
      _selectedOption = option;
      _showCalendar = option == 'Custom Range';


      final now = DateTime.now();
      switch (option) {
        case 'Today':
          _startDate = DateTime(now.year, now.month, now.day);
          _endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
          break;
        case 'Yesterday':
          final yesterday = now.subtract(const Duration(days: 1));
          _startDate = DateTime(yesterday.year, yesterday.month, yesterday.day);
          _endDate = DateTime(
              yesterday.year, yesterday.month, yesterday.day, 23, 59, 59);
          break;
        case 'Last 7 Days':
          _startDate = DateTime(now.year, now.month, now.day - 6);
          _endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
          break;
        case 'Last 30 Days':
          _startDate = DateTime(now.year, now.month, now.day - 29);
          _endDate = DateTime(now.year, now.month, now.day, 23, 59, 59);
          break;
        case 'This Month':
          _startDate = DateTime(now.year, now.month, 1);
          _endDate = DateTime(now.year, now.month + 1, 0, 23, 59, 59);
          break;
        case 'Last Month':
          _startDate = DateTime(now.year, now.month - 1, 1);
          _endDate = DateTime(now.year, now.month, 0, 23, 59, 59);
          break;
        case 'Custom Range':
          // Reset calendar selections
          _selectedStartDay = null;
          _selectedEndDay = null;

          _removeOverlay();
          _showDropdown();
          return;
      }

      widget.onDateRangeSelected(_startDate, _endDate);
      if (option != 'Custom Range') {
        _removeOverlay();
      }
    });
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if (_selectedStartDay == null ||
          (_selectedStartDay != null && _selectedEndDay != null)) {
        _selectedStartDay = selectedDay;
        _selectedEndDay = null;
      } else if (_selectedEndDay == null &&
          selectedDay.isAfter(_selectedStartDay!)) {
        _selectedEndDay = selectedDay;
        _startDate = _selectedStartDay;
        _endDate = DateTime(_selectedEndDay!.year, _selectedEndDay!.month,
            _selectedEndDay!.day, 23, 59, 59);
      } else {
        _selectedStartDay = selectedDay;
        _selectedEndDay = null;
      }
      _focusedDay = focusedDay;

      _removeOverlay();
      _showDropdown();
    });
  }

  void applyDateRange() {
    if (_selectedStartDay != null && _selectedEndDay != null) {
      setState(() {
        _selectedOption = 'Custom Range';
        _startDate = _selectedStartDay;
        _endDate = _selectedEndDay;
        widget.onDateRangeSelected(_startDate, _endDate);
        _removeOverlay();
      });
    }
  }

  void clearDateRange() {
    setState(() {
      _selectedStartDay = null;
      _selectedEndDay = null;
      _startDate = null;
      _endDate = null;
      widget.onDateRangeSelected(null, null);
    });
  }

  Widget buildOptionsListView() {
    final List<String> optionLabels = [
      'Today',
      'Yesterday',
      'Last 7 Days',
      'Last 30 Days',
      'This Month',
      'Last Month',
      'Custom Range',
    ];

    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: optionLabels.length,
      itemBuilder: (context, index) {
        final option = optionLabels[index];
        return ListTile(
          dense: true,
          selected: _selectedOption == option,
          selectedTileColor: CustomColors.redColor.withOpacity(0.1),
          title: Text(
            option,
            style: TextStyle(
                fontFamily: 'PoppinsRegular',
                fontSize: 14,
                color: CustomColors.blackColor),
          ),
          onTap: () => _selectDateOption(option),
        );
      },
    );
  }

  Widget buildCustomCalendar(
      BuildContext context, DateTime day, DateTime focusedDay) {
    final bool isToday = isSameDay(day, DateTime.now());
    final bool isSelected = _selectedStartDay != null &&
        _selectedEndDay != null &&
        (isSameDay(_selectedStartDay!, day) ||
            isSameDay(_selectedEndDay!, day));
    final bool isInRange = _selectedStartDay != null &&
        _selectedEndDay != null &&
        day.isAfter(_selectedStartDay!) &&
        day.isBefore(_selectedEndDay!);
    final bool isWeekend =
        day.weekday == DateTime.saturday || day.weekday == DateTime.sunday;

    final bool isOutsideMonth = day.month != focusedDay.month;

    final bool isRangeStart =
        _selectedStartDay != null && isSameDay(_selectedStartDay!, day);
    final bool isRangeEnd =
        _selectedEndDay != null && isSameDay(_selectedEndDay!, day);

    Color textColor;
    Color? backgroundColor;
    BoxShape shape = BoxShape.circle;

    if (isSelected || isRangeStart || isRangeEnd) {
      textColor = CustomColors.whiteColor;
      backgroundColor = CustomColors.redColor;
    } else if (isInRange) {
      textColor = CustomColors.blackColor;
      backgroundColor = CustomColors.redColor;
    } else if (isToday) {
      textColor = CustomColors.whiteColor;
      backgroundColor = CustomColors.redColor.withOpacity(0.7);
    } else if (isWeekend) {
      textColor = day.weekday == DateTime.saturday
          ? CustomColors.redColor
          : CustomColors.redColor;
      backgroundColor = null;
    } else if (isOutsideMonth) {
      textColor = CustomColors.greyColor;
      backgroundColor = null;
    } else {
      textColor = CustomColors.blackColor;
      backgroundColor = null;
    }

    return Container(
      width: 35,
      height: 35,
      alignment: Alignment.center,
      decoration: backgroundColor != null
          ? BoxDecoration(
              color: backgroundColor,
              shape: shape,
            )
          : null,
      margin: const EdgeInsets.all(1),
      child: Text(
        '${day.day}',
        style: TextStyle(
            color: textColor, fontSize: 14, fontFamily: 'PoppinsRegular'),
      ),
    );
  }

  Widget buildCalendarView() {

    final DateTime currentMonth =
        DateTime.now().add(Duration(days: 30 * _currentMonth));
    final String currentMonthName = DateFormat('MMM yyyy').format(currentMonth);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Month navigation
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () {
                  setState(() {
                    _currentMonth -= 1;
                    _focusedDay =
                        DateTime(_focusedDay.year, _focusedDay.month - 1, 1);
                  });
                  _removeOverlay();
                  _showDropdown();
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                iconSize: 20,
                color: CustomColors.borderColor,
              ),
              Text(
                currentMonthName,
                style: TextStyle(
                    color: CustomColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    fontFamily: 'PoppinsMedium'),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: () {
                  setState(() {
                    _currentMonth += 1;
                    _focusedDay =
                        DateTime(_focusedDay.year, _focusedDay.month + 1, 1);
                  });
                  _removeOverlay();
                  _showDropdown();
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                iconSize: 20,
                color: CustomColors.borderColor,
              ),
            ],
          ),
        ),

        // Custom calendar layout
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDayOfWeekHeader('Sun', CustomColors.redColor),
                _buildDayOfWeekHeader('Mon', CustomColors.blackColor),
                _buildDayOfWeekHeader('Tue', CustomColors.blackColor),
                _buildDayOfWeekHeader('Wed', CustomColors.blackColor),
                _buildDayOfWeekHeader('Thu', CustomColors.blackColor),
                _buildDayOfWeekHeader('Fri', CustomColors.blackColor),
                _buildDayOfWeekHeader('Sat', CustomColors.redColor),
              ],
            ),
            const SizedBox(height: 8),

            // Calendar grid
            TableCalendar(
              firstDay: DateTime.now().subtract(const Duration(days: 365)),
              lastDay: DateTime.now().add(const Duration(days: 365)),
              focusedDay: _focusedDay,
              calendarFormat: CalendarFormat.month,
              headerVisible: false,
              daysOfWeekVisible: false,
              calendarBuilders: CalendarBuilders(
                defaultBuilder: buildCustomCalendar,
                selectedBuilder: buildCustomCalendar,
                todayBuilder: buildCustomCalendar,
                markerBuilder: (context, date, events) => null,
                outsideBuilder: (context, day, focusedDay) =>
                    buildCustomCalendar(context, day, focusedDay),
                rangeStartBuilder: buildCustomCalendar,
                rangeEndBuilder: buildCustomCalendar,
                withinRangeBuilder: buildCustomCalendar,
              ),
              startingDayOfWeek: StartingDayOfWeek.sunday,
              selectedDayPredicate: (day) {
                return _selectedStartDay != null &&
                        isSameDay(_selectedStartDay!, day) ||
                    _selectedEndDay != null && isSameDay(_selectedEndDay!, day);
              },
              rangeStartDay: _selectedStartDay,
              rangeEndDay: _selectedEndDay,
              onDaySelected: onDaySelected,
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                  // Calculate proper current month index
                  final now = DateTime.now();
                  final monthDiff = (focusedDay.year - now.year) * 12 +
                      focusedDay.month -
                      now.month;
                  _currentMonth = monthDiff;
                });
              },
              rowHeight: 36,
            ),
          ],
        ),

        // Selected date range display
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            _selectedStartDay != null && _selectedEndDay != null
                ? '${DateFormat('dd/MM/yyyy').format(_selectedStartDay!)} - ${DateFormat('dd/MM/yyyy').format(_selectedEndDay!)}'
                : 'Select date range',
            style: TextStyle(
                color: CustomColors.blackColor,
                fontFamily: 'PoppinsRegular',
                fontSize: 13),
          ),
        ),

        // Action buttons
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  clearDateRange();
                  _removeOverlay();
                  _showDropdown();
                },
                style: TextButton.styleFrom(
                  foregroundColor: CustomColors.whiteColor,
                ),
                child: Text(
                  'Clear',
                  style: TextStyle(
                      color: CustomColors.blackColor,
                      fontSize: 14,
                      fontFamily: 'PoppinsRegular'),
                ),
              ),
              ElevatedButton(
                onPressed: _selectedStartDay != null && _selectedEndDay != null
                    ? applyDateRange
                    : null,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(08),
                  ),
                  backgroundColor: CustomColors.redColor,
                  foregroundColor: CustomColors.whiteColor,
                  fixedSize: const Size(90, 30),
                ),
                child: Text(
                  'Apply',
                  style: TextStyle(
                      color: CustomColors.whiteColor,
                      fontSize: 14,
                      fontFamily: 'PoppinsRegular'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDayOfWeekHeader(String day, Color color) {
    return Expanded(
      child: Center(
        child: Text(
          day,
          style:
              TextStyle(color: color, fontSize: 12, fontFamily: 'PoppinsRegular'
                  // fontWeight: FontWeight.bold,
                  ),
        ),
      ),
    );
  }

  String _formatDateRange() {
    if (_startDate == null || _endDate == null) {
      return 'Select Date Range';
    }

    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return '${formatter.format(_startDate!)} - ${formatter.format(_endDate!)}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _dropdownKey,
      onTap: _toggleDropdown,
      child: Container(
        height: 54,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.borderColor, width: 0.5),
          borderRadius: BorderRadius.circular(
            8,
          ),
          color: CustomColors.whiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                _selectedOption == 'Select Date Range' || _startDate == null
                    ? _selectedOption
                    : _formatDateRange(),
                style: TextStyle(
                    color: _selectedOption == 'Select Date Range'
                        ? CustomColors.greyColor
                        : CustomColors.blackColor,
                    fontFamily: 'PoppinsRegular',
                    fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(_isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                color: CustomColors.greyColor),
          ],
        ),
      ),
    );
  }
}
