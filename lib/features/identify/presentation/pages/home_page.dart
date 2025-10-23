import 'package:bloomix/core/ads/ad_manager.dart';
import 'package:bloomix/features/identify/presentation/cubit/identify_cubit.dart';
import 'package:bloomix/features/identify/presentation/pages/camera_page.dart';
import 'package:bloomix/features/identify/presentation/widgets/history_section.dart';
import 'package:bloomix/l10n/l10n.dart';
import 'package:bloomix_ds/bloomix_ds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AdManager _adManager = AdManager();

  @override
  void initState() {
    super.initState();
    _adManager.loadBannerAd();
  }

  @override
  void dispose() {
    _adManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BloomixColors.primary50,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(BloomixSpacing.xxxl),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: BloomixSpacing.huge),
                    _buildHeader(),
                    const SizedBox(height: BloomixSpacing.enormous),
                    _buildIdentifyButton(context),
                    SizedBox(height: BloomixSpacing.custom(7)),
                    _buildHistorySection(),
                  ],
                ),
              ),
            ),
            _adManager.buildBannerAdWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(BloomixSpacing.lg),
              decoration: BoxDecoration(
                color: BloomixColors.primary500,
                borderRadius: BorderRadius.circular(BloomixSizing.radiusXl),
              ),
              child: const Icon(
                Icons.local_florist,
                color: BloomixColors.textOnPrimary,
                size: BloomixSizing.iconXxl,
              ),
            ),
            const SizedBox(width: BloomixSpacing.xl),
            Text(
              AppLocalizations.of(context).appName,
              style: BloomixTypography.displayLarge.copyWith(
                color: BloomixColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: BloomixSpacing.lg),
        Text(
          AppLocalizations.of(context).appTagline,
          style: BloomixTypography.titleMedium.copyWith(
            color: BloomixColors.primary500,
          ),
        ),
        const SizedBox(height: BloomixSpacing.xxxl),
        Text(
          AppLocalizations.of(context).appDescription,
          style: BloomixTypography.bodyMedium.copyWith(
            color: BloomixColors.withOpacity(BloomixColors.textPrimary, 0.7),
          ),
        ),
      ],
    );
  }

  Widget _buildIdentifyButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: BloomixSizing.custom(50),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            BloomixColors.primary500,
            BloomixColors.primary400,
            BloomixColors.primary300,
          ],
        ),
        borderRadius: BorderRadius.circular(BloomixSizing.radiusHuge),
        boxShadow: [
          BoxShadow(
            color: BloomixColors.withOpacity(BloomixColors.primary500, 0.4),
            blurRadius: BloomixSizing.elevationXxxl,
            offset: const Offset(0, BloomixSpacing.lg),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(builder: (_) => const CameraPage()),
            );
          },
          borderRadius: BorderRadius.circular(BloomixSizing.radiusHuge),
          child: Padding(
            padding: const EdgeInsets.all(BloomixSpacing.huge),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(BloomixSpacing.xl),
                  decoration: BoxDecoration(
                    color:
                        BloomixColors.withOpacity(BloomixColors.surface, 0.2),
                    borderRadius:
                        BorderRadius.circular(BloomixSizing.radiusXxl),
                  ),
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    size: BloomixSizing.iconHuge,
                    color: BloomixColors.textOnPrimary,
                  ),
                ),
                const SizedBox(height: BloomixSpacing.xxl),
                Text(
                  AppLocalizations.of(context).identifyPlant,
                  style: BloomixTypography.displaySmall.copyWith(
                    color: BloomixColors.textOnPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHistorySection() {
    return BlocBuilder<IdentifyCubit, IdentifyState>(
      builder: (context, state) {
        if (state.history.isEmpty) {
          return Container(
            padding: const EdgeInsets.all(BloomixSpacing.huge),
            decoration: BoxDecoration(
              color: BloomixColors.surface,
              borderRadius: BorderRadius.circular(BloomixSizing.radiusXxxl),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.eco_outlined,
                  size: BloomixSizing.custom(16),
                  color:
                      BloomixColors.withOpacity(BloomixColors.primary500, 0.3),
                ),
                const SizedBox(height: BloomixSpacing.xl),
                Text(
                  AppLocalizations.of(context).noPlantsIdentifiedYet,
                  style: BloomixTypography.titleMedium.copyWith(
                    color: BloomixColors.withOpacity(
                      BloomixColors.textPrimary,
                      0.6,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: BloomixSpacing.sm),
                Text(
                  AppLocalizations.of(context).startPhotographing,
                  style: BloomixTypography.bodyMedium.copyWith(
                    color: BloomixColors.withOpacity(
                      BloomixColors.textPrimary,
                      0.4,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).recentHistory,
              style: BloomixTypography.headlineLarge.copyWith(
                color: BloomixColors.textPrimary,
              ),
            ),
            const SizedBox(height: BloomixSpacing.xxl),
            HistorySection(plants: state.history.take(3).toList()),
          ],
        );
      },
    );
  }
}
