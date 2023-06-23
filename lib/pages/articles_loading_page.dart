import 'package:flutter/material.dart';
import 'package:test_project/constants/color_constants.dart';
import 'package:test_project/widgets/shimmer_loading.dart';

class ArticlesLoadingPage extends StatelessWidget {
  const ArticlesLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ShimmerLoading(
                  height: 32,
                  width: 200,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(
                          right: 16,
                        ),
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            ShimmerLoading(
                              height: 24,
                              width: 100,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            ShimmerLoading(
                              height: 150,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: 4,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: ColorConstants.grey300,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ShimmerLoading(
                                height: 100,
                                width: 100,
                                baseColor: ColorConstants.grey100,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              ShimmerLoading(
                                height: 50,
                                width: 190,
                                baseColor: ColorConstants.grey100,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          ShimmerLoading(
                            height: 48,
                            baseColor: ColorConstants.grey100,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ShimmerLoading(
                            height: 24,
                            width: 200,
                            baseColor: ColorConstants.grey100,
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 5,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
