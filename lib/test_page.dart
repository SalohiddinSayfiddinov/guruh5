import 'package:flutter/material.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child:
              isMobile
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _Header(),
                      const SizedBox(height: 12),
                      const _LeadText(),
                      const SizedBox(height: 20),
                      _StatsGrid(isMobile: true),
                      const SizedBox(height: 20),
                      const _BodyText(),
                      const SizedBox(height: 24),
                      _MoreButton(onPressed: () {}),
                      const SizedBox(height: 24),
                      // Mobil rasm: balandlikka cheklov beramiz
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 380),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            "assets/image/tools.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  )
                  : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Matn qismi
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const _Header(),
                            const SizedBox(height: 12),
                            const _LeadText(),
                            const SizedBox(height: 20),
                            _StatsGrid(isMobile: false),
                            const SizedBox(height: 20),
                            const _BodyText(),
                            const SizedBox(height: 24),
                            _MoreButton(onPressed: () {}),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      // Rasm qismi: doimo nazorat ostida
                      Flexible(
                        flex: 1,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 420),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(
                              "lib/testAssets/tools.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "О нашем магазине",
      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }
}

class _LeadText extends StatelessWidget {
  const _LeadText();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Цель и главная задача компании - создать сервис, который не ограничится продажей "
      "строительных и отделочных материалов, а будет решать задачи и трудности, "
      "с которыми сталкиваются люди во время ремонта.",
      style: TextStyle(fontSize: 16, height: 1.5),
    );
  }
}

class _BodyText extends StatelessWidget {
  const _BodyText();
  @override
  Widget build(BuildContext context) {
    return const Text(
      "Уже второе десятилетие мы помогаем воплотить в реальность Вашу мечту о хорошем, "
      "комфортабельном доме. Благодаря современным сервисам, удобству покупки онлайн, "
      "разнообразию ассортимента, мы предлагаем любые строительные и дизайнерские решения "
      "с минимальными затратами времени и денежных средств.",
      style: TextStyle(fontSize: 16, height: 1.5),
    );
  }
}

class _MoreButton extends StatelessWidget {
  final VoidCallback onPressed;
  const _MoreButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),
      child: const Text("ПОДРОБНЕЕ О КОМПАНИИ"),
    );
  }
}

/// Grid ko‘rinishidagi barqaror statistikalar
class _StatsGrid extends StatelessWidget {
  final bool isMobile;
  const _StatsGrid({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = isMobile ? 2 : 4;

    return Wrap(
      spacing: 16,
      runSpacing: 12,
      children: const [
        _Stat(number: "17 805,3 м²", label: "торговых и складских помещений"),
        _Stat(number: "50 000+", label: "наименований товаров"),
        _Stat(number: "2 500+", label: "постоянных клиентов"),
        _Stat(number: "440", label: "опытных сотрудников"),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  final String number;
  final String label;
  const _Stat({required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
