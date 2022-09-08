import 'package:company_profile/repo/repo.dart';
import 'package:company_profile/ui/company_details_page.dart';
import 'package:flutter/material.dart';

class CompanyDetailsAnimator extends StatefulWidget {
  const CompanyDetailsAnimator({Key? key}) : super(key: key);

  @override
  State<CompanyDetailsAnimator> createState() => _CompanyDetailsAnimatorState();
}

class _CompanyDetailsAnimatorState extends State<CompanyDetailsAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1780),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompanyDetailsPage(
      company: RepoData.bawr,
      controller: _controller,
    );
  }
}
