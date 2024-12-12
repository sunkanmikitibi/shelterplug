import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TopDeveloperList extends StatelessWidget {
  const TopDeveloperList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(shrinkWrap: true, children: const [
        TopDeveloperWidget(
          title: "Prunes and Quince",
          subtitle: "Prunes & Quince Limited is a wholly indigenous construction company with a bias for undertaking Real Estate Project essentially within the country.",
          leadingIcon: Iconsax.user4,
          trailingIcon: Iconsax.arrow_right,
        ),
        TopDeveloperWidget(
          title: "Design and Shelter",
           subtitle: "We develop properties in prime locations in many ways that reflect taste and luxury. ",
          leadingIcon: Iconsax.user4,
          trailingIcon: Iconsax.arrow_right,
        ),
        TopDeveloperWidget(
          title: "Clergysaoni properties",
           subtitle: "We are a Real Estate and Valuation Company, as well as Property Management. We provide Housing services which includes Sales, Lease, premium Commercial and Residential Property Management.",
          leadingIcon: Iconsax.user4,
          trailingIcon: Iconsax.arrow_right,
        ),        
      ]),
    );
  }
}

class TopDeveloperWidget extends StatelessWidget {
  const TopDeveloperWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.trailingIcon,
    required this.leadingIcon,
  });
  final String title;
  final String subtitle;
  final IconData trailingIcon;
  final IconData leadingIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Icon(leadingIcon),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall,
      ),
      subtitle: Text(subtitle, maxLines: 2,),
      trailing: Icon(trailingIcon),
    );
  }
}
