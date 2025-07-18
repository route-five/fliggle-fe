String timeFormat(DateTime time) {
  final DateTime now = DateTime.now();
  final Duration difference = now.difference(time);

  if (difference.inSeconds < 60) {
    return '${difference.inSeconds}초 전';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes}분 전';
  } else if (difference.inHours < 24) {
    return '${difference.inHours}시간 전';
  } else if (difference.inDays < 7) {
    return '${difference.inDays}일 전';
  } else if (difference.inDays < 30) {
    final weeks = (difference.inDays / 7).floor();
    return '$weeks주 전';
  } else if (now.year == time.year) {
    return '${time.month}월 ${time.day}일';
  } else {
    return '${time.year}년 ${time.month}월 ${time.day}일';
  }
}
