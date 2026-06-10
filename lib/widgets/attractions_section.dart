import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import '../utils/constants.dart';
import 'common_widgets.dart';

class AttractionsSection extends StatelessWidget {
  const AttractionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppState.of(context).t;
    final colors = AppState.of(context).colors;

    final attrs = [
      (t.forbiddenCity, 'The Forbidden City', t.forbiddenCityDesc, BeijingImages.forbiddenCity,
          t.fcLocation, t.fcTicket, t.fcTime, t.forbiddenCityHighlight),
      (t.greatWall, 'The Great Wall', t.greatWallDesc, BeijingImages.greatWall,
          t.gwLocation, t.gwTicket, t.gwTime, t.greatWallHighlight),
      (t.templeHeaven, 'Temple of Heaven', t.templeHeavenDesc, BeijingImages.templeOfHeaven,
          t.thLocation, t.thTicket, t.thTime, t.templeHeavenHighlight),
      (t.shougang, 'Shougang Park', t.shougangDesc, BeijingImages.shougangPark,
          t.sgLocation, t.sgTicket, t.sgTime, t.shougangHighlight),
      (t.universal, 'Universal Studios Beijing', t.universalDesc, BeijingImages.universalStudios,
          t.usLocation, t.usTicket, t.usTime, t.universalHighlight),
      (t.guomao, 'Guomao CBD', t.guomaoDesc, BeijingImages.guomaoCBD,
          t.gmLocation, t.gmTicket, t.gmTime, t.guomaoHighlight),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: t.attractionsTitle, subtitle: t.attractionsSubtitle, icon: Icons.photo_camera),
        const SizedBox(height: 4),
        ...attrs.asMap().entries.map((e) => _AttractionCard(
              attr: e.value,
              index: e.key,
              colors: colors,
            )),
      ],
    );
  }
}

typedef _AttrData = (String, String, String, String, String, String, String, String);

class _AttractionCard extends StatelessWidget {
  final _AttrData attr;
  final int index;
  final dynamic colors;

  const _AttractionCard({required this.attr, required this.index, required this.colors});

  @override
  Widget build(BuildContext context) {
    final name = attr.$1;
    final nameEn = attr.$2;
    final desc = attr.$3;
    final imageUrl = attr.$4;
    final location = attr.$5;
    final ticket = attr.$6;
    final openTime = attr.$7;
    final highlight = attr.$8;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: colors.cardBg,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: _minHeightForIndex(index)),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              // ── 左侧图片 ──
              SizedBox(
                width: 200,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Hero(
                      tag: 'attraction_$index',
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          decoration: BoxDecoration(gradient: colors.primaryGradient),
                          child: const Icon(Icons.landscape, color: Colors.white38, size: 40),
                        ),
                      ),
                    ),
                    // 编号
                    Positioned(
                      top: 10, left: 10,
                      child: Container(
                        width: 28, height: 28,
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text('${index + 1}',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13)),
                        ),
                      ),
                    ),
                    // 底部门票
                    Positioned(
                      left: 0, right: 0, bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black.withValues(alpha: 0.7)],
                          ),
                        ),
                        child: Text(
                          ticket,
                          style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // ── 右侧信息 ──
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: colors.textDark)),
                      const SizedBox(height: 2),
                      Text(nameEn, style: TextStyle(fontSize: 11, color: colors.textLight, letterSpacing: 0.5)),
                      const SizedBox(height: 10),
                      Text(desc, style: TextStyle(fontSize: 12.5, color: colors.textMedium, height: 1.5)),
                      const SizedBox(height: 10),
                      _InfoRow(icon: Icons.location_on_outlined, text: location, colors: colors),
                      const SizedBox(height: 4),
                      _InfoRow(icon: Icons.access_time, text: openTime, colors: colors),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 5, runSpacing: 5,
                        children: highlight.split(' · ').map(
                          (h) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: colors.primary.withValues(alpha: 0.07),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(h, style: TextStyle(fontSize: 10, color: colors.primary, fontWeight: FontWeight.w500)),
                          ),
                        ).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ),
        ),
      ),
    );
  }
}

double _minHeightForIndex(int index) {
  const base = 260.0;
  const extra = {1: 1.0, 2: 1.0, 4: 1.0, 5: 4.0};
  return base + (extra[index] ?? 0);
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final dynamic colors;

  const _InfoRow({required this.icon, required this.text, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(icon, size: 13, color: colors.textLight),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(text, style: TextStyle(fontSize: 11, color: colors.textLight, height: 1.3)),
        ),
      ],
    );
  }
}
