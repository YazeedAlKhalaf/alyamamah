import 'package:alyamamah/home/view/home_card.dart';
import 'package:alyamamah/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              context.l10n.hi_name('YAZEED'),
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 12),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: HomeCard(
                          title: context.l10n.my_schedule,
                          icon: Icons.table_chart_rounded,
                          onTap: () {
                            context.push('/my-schedule');
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: HomeCard(
                          title: context.l10n.absences,
                          icon: Icons.person_off_rounded,
                          onTap: () {
                            // TODO: go to absences page
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: HomeCard(
                          title: context.l10n.penalties,
                          icon: Icons.warning_rounded,
                          onTap: () {
                            // TODO: go to penalties page
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: HomeCard(
                          title: context.l10n.more_coming_soon,
                          icon: Icons.hourglass_bottom_rounded,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
