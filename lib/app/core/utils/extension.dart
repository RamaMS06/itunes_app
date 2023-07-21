formatDuration(Duration d) =>
    d.toString().split('.').first.padLeft(8, "0").replaceFirst('00:', '');
