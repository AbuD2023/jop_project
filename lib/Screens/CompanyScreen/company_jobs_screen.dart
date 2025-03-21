import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jop_project/Providers/Job/job_provider.dart';
import 'package:jop_project/Providers/Orders/order_provider.dart';
import 'package:jop_project/Screens/CompanyScreen/applicants_screen.dart';
import 'package:jop_project/Screens/CompanyScreen/edit_job_screen.dart';
import 'package:jop_project/components/background.dart';
import 'package:jop_project/Models/company_model.dart';
import 'package:jop_project/constants.dart';
import 'package:jop_project/l10n/l10n.dart';
import 'package:provider/provider.dart';

class CompanyJobsScreen extends StatefulWidget {
  final CompanyModel company;

  const CompanyJobsScreen({
    super.key,
    required this.company,
  });

  @override
  State<CompanyJobsScreen> createState() => _CompanyJobsScreenState();
}

class _CompanyJobsScreenState extends State<CompanyJobsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<JobsProvider>(context, listen: false)
          .getJobsByCompanyId(companyId: widget.company.id!);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final jobProvider = Provider.of<JobsProvider>(context);
    // final orders = Provider.of<OrderProvider>(context);
    final l10n = AppLocalizations.of(context);

    return Material(
      child: Stack(
        // alignment: Alignment.center,
        children: [
          Background(
            userImage: widget.company.img,
            userName: widget.company.nameCompany,
            showListNotiv: true,
            isCompany: true,
            title: l10n.jobs,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 85),
              child: Consumer<JobsProvider>(
                  builder: (context, jobsProvider, child) {
                return !jobsProvider.isLoading
                    ? jobsProvider.jobsById.isNotEmpty
                        ? ListView.builder(
                            itemCount: jobsProvider.jobsById.length,
                            padding: const EdgeInsets.all(16),
                            itemBuilder: (context, index) {
                              final job = jobsProvider.jobsById[index];
                              // final count = orders.orders
                              //     .where((element) =>
                              //         element.jobAdvertisementId == job.id)
                              //     .length;
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ApplicantsScreen(job: job),
                                      ));
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 4,
                                            bottom: 4,
                                            left: 8,
                                            right: 8),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              blurRadius: 2,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                            color: kJobBorderColor,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            PopupMenuButton(
                                              itemBuilder: (context) => [
                                                PopupMenuItem(
                                                  value: 'edit',
                                                  child: Text(l10n.edit),
                                                ),
                                                PopupMenuItem(
                                                  value: 'delete',
                                                  child: Text(l10n.delete),
                                                ),
                                              ],
                                              onSelected: (value) async {
                                                if (value == 'edit') {
                                                  // تنفيذ العملية المطلوبة
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            EditJopScreen(
                                                          jobAdvertisementModel:
                                                              job,
                                                        ),
                                                      ));
                                                } else if (value == 'delete') {
                                                  // تنفيذ العملية المطلوبة

                                                  await jobsProvider.deleteJob(
                                                      jobId: job.id!);
                                                }
                                              },
                                            ),
                                            Text(
                                              job.nameJob.toString(),
                                              textAlign: TextAlign.right,
                                              textDirection: TextDirection.rtl,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: kSecondaryTextColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          width: 100,
                                          height: 60,
                                          // height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: kJobCardBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  kJobCirclarTextColor,
                                              // radius: 5,
                                              maxRadius: 15,
                                              minRadius: 15,

                                              child: Text(
                                                '${job.orders?.length}',
                                                textDirection:
                                                    TextDirection.rtl,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  // fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : Center(
                            child: Text(
                              l10n.notjobs,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              }),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: IconButton(
                tooltip: l10n.toupdate,
                onPressed: () {
                  context
                      .read<JobsProvider>()
                      .getJobsByCompanyId(companyId: widget.company.id!);
                },
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: Center(
              child: Column(
                children: [
                  // Text('الوظائف'),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: widget.company.img != null
                            ? NetworkImage(widget.company.img!)
                            : const AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  ),
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Text(
                        widget.company.nameCompany ?? '',
                        style: const TextStyle(
                            color: kPrimaryTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
