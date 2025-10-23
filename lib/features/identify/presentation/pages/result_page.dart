import 'dart:io';

import 'package:bloomix/core/ads/ad_manager.dart';
import 'package:bloomix/features/identify/presentation/cubit/identify_cubit.dart';
import 'package:bloomix/l10n/l10n.dart';
import 'package:bloomix_ds/bloomix_ds.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final AdManager _adManager = AdManager();

  @override
  void dispose() {
    _adManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BloomixColors.primary50,
      body: BlocConsumer<IdentifyCubit, IdentifyState>(
        listener: (context, state) {
          if (state is IdentifySuccess && state.shouldShowAd) {
            if (!kIsWeb) {
              _adManager.showInterstitialAd();
            }
          }
        },
        builder: (context, state) {
          if (state is IdentifyLoading) {
            return _buildLoadingState();
          } else if (state is IdentifySuccess) {
            return _buildSuccessState(state);
          } else if (state is IdentifyError) {
            return _buildErrorState(state.message);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildLoadingState() {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: BloomixSizing.custom(30),
              height: BloomixSizing.custom(30),
              decoration: BoxDecoration(
                color: BloomixColors.surface,
                borderRadius: BorderRadius.circular(BloomixSizing.radiusHuge),
                boxShadow: [
                  BoxShadow(
                    color: BloomixColors.withOpacity(
                      BloomixColors.primary500,
                      0.2,
                    ),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(BloomixColors.primary500),
                  strokeWidth: 3,
                ),
              ),
            ),
            const SizedBox(height: BloomixSpacing.huge),
            Text(
              AppLocalizations.of(context).analyzingPlant,
              style: BloomixTypography.headlineLarge.copyWith(
                color: BloomixColors.textPrimary,
              ),
            ),
            const SizedBox(height: BloomixSpacing.lg),
            Text(
              AppLocalizations.of(context).thisMayTakeSeconds,
              style: BloomixTypography.bodyMedium.copyWith(
                color:
                    BloomixColors.withOpacity(BloomixColors.textPrimary, 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSuccessState(IdentifySuccess state) {
    final plant = state.plantInfo;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildAppBar(),
            if (!kIsWeb && plant.imagePath != null)
              _buildPlantImage(plant.imagePath!),
            Padding(
              padding: const EdgeInsets.all(BloomixSpacing.xxxl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildPlantNameCard(
                    plant.name,
                    plant.scientificName,
                    plant.confidence,
                  ),
                  const SizedBox(height: BloomixSpacing.xxl),
                  _buildInfoCard(
                    '💧 ${AppLocalizations.of(context).watering}',
                    plant.watering,
                    Icons.water_drop,
                  ),
                  const SizedBox(height: BloomixSpacing.xl),
                  _buildInfoCard(
                    '☀️ ${AppLocalizations.of(context).light}',
                    plant.light,
                    Icons.wb_sunny,
                  ),
                  const SizedBox(height: BloomixSpacing.xl),
                  _buildInfoCard(
                    '💡 ${AppLocalizations.of(context).tips}',
                    plant.tips,
                    Icons.lightbulb,
                  ),
                  const SizedBox(height: BloomixSpacing.xxxl),
                  _buildBackButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(BloomixSpacing.huge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(BloomixSpacing.xxxl),
                decoration: BoxDecoration(
                  color: BloomixColors.surface,
                  borderRadius: BorderRadius.circular(BloomixSizing.radiusXxxl),
                ),
                child: Icon(
                  Icons.error_outline,
                  size: BloomixSizing.custom(20),
                  color: BloomixColors.withOpacity(BloomixColors.error, 0.7),
                ),
              ),
              const SizedBox(height: BloomixSpacing.xxxl),
              Text(
                AppLocalizations.of(context).somethingWentWrong,
                style: BloomixTypography.headlineLarge.copyWith(
                  color: BloomixColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: BloomixSpacing.lg),
              Text(
                message,
                style: BloomixTypography.bodyMedium.copyWith(
                  color:
                      BloomixColors.withOpacity(BloomixColors.textPrimary, 0.6),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: BloomixSpacing.huge),
              _buildBackButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.all(BloomixSpacing.xxl),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: BloomixColors.surface,
              borderRadius: BorderRadius.circular(BloomixSizing.radiusXl),
              boxShadow: [
                BoxShadow(
                  color:
                      BloomixColors.withOpacity(BloomixColors.neutral900, 0.1),
                  blurRadius: BloomixSizing.elevationSm,
                  offset: const Offset(0, BloomixSpacing.sm),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: BloomixColors.textPrimary,
              ),
              onPressed: () {
                context.read<IdentifyCubit>().reset();
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(width: BloomixSpacing.xl),
          Text(
            AppLocalizations.of(context).result,
            style: BloomixTypography.displaySmall.copyWith(
              color: BloomixColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlantImage(String imagePath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: BloomixSpacing.xxxl),
      height: BloomixSizing.custom(70),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(BloomixSizing.radiusHuge),
        boxShadow: [
          BoxShadow(
            color: BloomixColors.withOpacity(BloomixColors.neutral900, 0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(BloomixSizing.radiusHuge),
        child: Image.file(
          File(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildPlantNameCard(
    String name,
    String scientificName,
    double confidence,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(BloomixSpacing.custom(7)),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            BloomixColors.primary500,
            BloomixColors.primary400,
          ],
        ),
        borderRadius: BorderRadius.circular(BloomixSizing.custom(7)),
        boxShadow: [
          BoxShadow(
            color: BloomixColors.withOpacity(BloomixColors.primary500, 0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: BloomixSpacing.lg,
                  vertical: BloomixSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: BloomixColors.withOpacity(BloomixColors.surface, 0.25),
                  borderRadius: BorderRadius.circular(BloomixSpacing.lg),
                ),
                child: Text(
                  '${(confidence * 100).toStringAsFixed(0)}${AppLocalizations.of(context).confidencePercentage}',
                  style: BloomixTypography.labelMedium.copyWith(
                    color: BloomixColors.textOnPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: BloomixSpacing.xl),
          Text(
            name,
            style: BloomixTypography.displayMedium.copyWith(
              color: BloomixColors.textOnPrimary,
            ),
          ),
          const SizedBox(height: BloomixSpacing.sm),
          Text(
            scientificName,
            style: BloomixTypography.titleMedium.copyWith(
              fontStyle: FontStyle.italic,
              color:
                  BloomixColors.withOpacity(BloomixColors.textOnPrimary, 0.9),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String content, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(BloomixSpacing.xxxl),
      decoration: BoxDecoration(
        color: BloomixColors.surface,
        borderRadius: BorderRadius.circular(BloomixSizing.radiusXxxl),
        boxShadow: [
          BoxShadow(
            color: BloomixColors.withOpacity(BloomixColors.neutral900, 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(BloomixSpacing.custom(2.5)),
                decoration: BoxDecoration(
                  color:
                      BloomixColors.withOpacity(BloomixColors.primary500, 0.1),
                  borderRadius: BorderRadius.circular(BloomixSpacing.lg),
                ),
                child: Icon(
                  icon,
                  color: BloomixColors.primary500,
                  size: BloomixSizing.iconMd,
                ),
              ),
              const SizedBox(width: BloomixSpacing.lg),
              Text(
                title,
                style: BloomixTypography.headlineSmall.copyWith(
                  color: BloomixColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: BloomixSpacing.xl),
          Text(
            content,
            style: BloomixTypography.bodyMedium.copyWith(
              color: BloomixColors.withOpacity(BloomixColors.textPrimary, 0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          context.read<IdentifyCubit>().reset();
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: BloomixColors.primary500,
          foregroundColor: BloomixColors.textOnPrimary,
          padding: EdgeInsets.symmetric(vertical: BloomixSpacing.custom(4.5)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(BloomixSizing.radiusXxl),
          ),
          elevation: 0,
        ),
        child: Text(
          AppLocalizations.of(context).backToHome,
          style: BloomixTypography.buttonLarge.copyWith(
            color: BloomixColors.textOnPrimary,
          ),
        ),
      ),
    );
  }
}
