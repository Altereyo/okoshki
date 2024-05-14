class SaloonStatistics {
  final int numWindows;
  final int numBookings;
  final int amountProfit;
  final int windowsCommissions;
  final int numDoneWindows;
  final int numClientCancelWindows;
  final int numClientNotComeWindows;
  final int numNotBookingWindows;

  const SaloonStatistics({
    required this.numWindows,
    required this.numBookings,
    required this.amountProfit,
    required this.windowsCommissions,
    required this.numDoneWindows,
    required this.numClientCancelWindows,
    required this.numClientNotComeWindows,
    required this.numNotBookingWindows,
  });

  @override
  String toString() {
    return 'SaloonStatistics{numWindows: $numWindows, numBookings: $numBookings, amountProfit: $amountProfit, windowsCommissions: $windowsCommissions, numDoneWindows: $numDoneWindows, numClientCancelWindows: $numClientCancelWindows, numNotBookingWindows: $numNotBookingWindows}';
  }
}

