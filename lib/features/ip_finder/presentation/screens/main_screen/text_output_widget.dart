

import 'package:flutter/material.dart';
import 'package:ip_finder/features/ip_finder/domain/enteties/ip_Info.dart';

class TextOutputWidget extends StatelessWidget {
  const TextOutputWidget({required this.ipInfoEntety});

  final IpInfoEntety ipInfoEntety;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(ipInfoEntety.ip),
        Text(ipInfoEntety.city),
        Text(ipInfoEntety.country),
        Text(ipInfoEntety.loc),
        Text(ipInfoEntety.org),
        Text(ipInfoEntety.region),
        Text(ipInfoEntety.timezone),
      ],);
  }
}