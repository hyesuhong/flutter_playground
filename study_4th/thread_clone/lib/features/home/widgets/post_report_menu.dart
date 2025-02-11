import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:thread_clone/constants/gaps.dart';
import 'package:thread_clone/constants/sizes.dart';

const _reportReasons = [
  "I just don’t like it",
  "Bullying or unwanted contact",
  "Suicide, self-injury or eating disorders",
  "Violence, hate or exploitation",
  "Selling or promoting restricted items",
  "Nudity or sexual activity",
  "Scam, fraud or spam",
  "False information",
];

class PostReportMenu extends StatelessWidget {
  const PostReportMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: Sizes.size48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
          ),
          child: const Text(
            "Report",
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: Sizes.size48,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size8,
          horizontal: Sizes.size12,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Why are you reporting this post?",
                    style: TextStyle(
                      fontSize: Sizes.size18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gaps.v6,
                  Text(
                    "Your report is anonymous. If someone is in immediate danger, call the local emergency services - don’t wait.",
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Gaps.v20,
            const Divider(height: 1),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_reportReasons[index]),
                  trailing: const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    size: Sizes.size16,
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemCount: _reportReasons.length,
            )
          ],
        ),
      ),
    );
  }
}
