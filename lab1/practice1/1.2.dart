void main() {
  int speed = 40;
  int distance = 25;

  double timeInHours = distance / speed;
  double timeInMinutes = timeInHours * 60;

  print('Time taken to cover $distance km at $speed km/h is: $timeInMinutes minutes');
}