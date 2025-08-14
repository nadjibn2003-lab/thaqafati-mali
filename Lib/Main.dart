import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ThaqafatiMaliApp());
}

class ThaqafatiMaliApp extends StatelessWidget {
  const ThaqafatiMaliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ثقافتي مالي',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6750A4)),
          fontFamily: 'Roboto',
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 2,
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

/* ========================= بيانات/نماذج ========================= */

class QA {
  final String q;
  final List<String> options;
  final int correct; // index

  const QA(this.q, this.options, this.correct);
}

// أسئلة سهلة (40)
const List<QA> easy = [
  QA('ما عاصمة الجزائر؟', ['وهران', 'الجزائر', 'سطيف', 'قسنطينة'], 1),
  QA('عدد قارات العالم؟', ['6', '7', '5', '8'], 1),
  QA('لون البحر في يوم صافٍ؟', ['أحمر', 'أزرق', 'أخضر', 'أصفر'], 1),
  QA('أكبر حيوان بري؟', ['الفيل', 'الأسد', 'الحصان', 'النمر'], 0),
  QA('كم عدد أيام الأسبوع؟', ['5', '6', '7', '8'], 2),
  QA('الشمس هي؟', ['كوكب', 'نجم', 'قمر', 'مذنب'], 1),
  QA('أقرب الكواكب إلى الشمس؟', ['عطارد', 'الزهرة', 'الأرض', 'المريخ'], 0),
  QA('اسم عملة المغرب؟', ['الجنيه', 'الدرهم', 'الدينار', 'الريال'], 1),
  QA('اسم عملة الجزائر؟', ['الدينار', 'الدرهم', 'الليرة', 'الفرنك'], 0),
  QA('مجموع 5 + 7؟', ['10', '11', '12', '13'], 2),
  QA('نتيجة 9 − 3؟', ['6', '5', '7', '3'], 0),
  QA('أكبر محيط؟', ['الأطلسي', 'الهندي', 'الهادئ', 'المتجمد'], 2),
  QA('عاصمة مصر؟', ['القاهرة', 'الإسكندرية', 'المنصورة', 'بورسعيد'], 0),
  QA('لغة المغرب الرسمية إلى جانب العربية؟', ['الفرنسية', 'الأمازيغية', 'الإسبانية', 'الإنجليزية'], 1),
  QA('عدد حروف اللغة العربية؟', ['26', '28', '30', '32'], 1),
  QA('نتيجة 6 × 4؟', ['20', '22', '24', '26'], 2),
  QA('أسرع حيوان بري؟', ['الفهد', 'الغزال', 'الحصان', 'الذئب'], 0),
  QA('عاصمة تونس؟', ['سوسة', 'تونس', 'صفاقس', 'قابس'], 1),
  QA('يطير؟', ['الحوت', 'الخفاش', 'الحصان', 'الثعلب'], 1),
  QA('جهاز التنفس في الإنسان؟', ['المعدة', 'الكبد', 'الرئتان', 'القلب'], 2),
  QA('لون إشارة المرور التي تعني قف؟', ['أخضر', 'أصفر', 'أحمر', 'أزرق'], 2),
  QA('نتيجة 15 ÷ 3؟', ['4', '5', '6', '7'], 1),
  QA('ملك الغابة؟', ['النمر', 'الأسد', 'الفهد', 'الضبع'], 1),
  QA('كوكب يعرف بالكوكب الأحمر؟', ['الزهرة', 'المريخ', 'زحل', 'أورانوس'], 1),
  QA('عدد أشهر السنة؟', ['10', '11', '12', '13'], 2),
  QA('أداة نسمع بها؟', ['العين', 'الأذن', 'اليد', 'الأنف'], 1),
  QA('الطائر الذي لا يطير؟', ['البطريق', 'الصقر', 'الحمام', 'النسر'], 0),
  QA('نتيجة 3²؟', ['6', '8', '9', '12'], 2),
  QA('شرب الماء مفيد لـ؟', ['النوم', 'التنفس', 'الجسم', 'الشمس'], 2),
  QA('قارة عربية إفريقية؟', ['أوروبا', 'آسيا', 'أفريقيا', 'أمريكا'], 2),
  QA('عاصمة السعودية؟', ['الرياض', 'جدة', 'مكة', 'الدمام'], 0),
  QA('أداة الشم؟', ['الفم', 'الأنف', 'الأذن', 'العين'], 1),
  QA('رياضة تُلعب بالقدم؟', ['كرة السلة', 'كرة اليد', 'كرة القدم', 'السباحة'], 2),
  QA('الجمل يُلقب بـ؟', ['ملك الغابة', 'سفينة الصحراء', 'أم الطيور', 'أسد البحار'], 1),
  QA('نتيجة 8 + 9؟', ['15', '16', '17', '18'], 2),
  QA('أخف المعادن؟', ['ذهب', 'حديد', 'ألمنيوم', 'ليثيوم'], 3),
  QA('أكبر قارة؟', ['أفريقيا', 'آسيا', 'أوروبا', 'أستراليا'], 1),
  QA('أداة الرؤية؟', ['الأذن', 'العين', 'الفم', 'الأنف'], 1),
  QA('حيوان بحري ثدي؟', ['القرش', 'الدلفين', 'الأخطبوط', 'الروبيان'], 1),
  QA('عدد أرجل العنكبوت؟', ['6', '8', '10', '12'], 1),
];

// أسئلة متوسطة (40)
const List<QA> medium = [
  QA('من مكتشف قانون الجاذبية؟', ['نيوتن', 'أينشتاين', 'غاليلو', 'بوهر'], 0),
  QA('سنة استقلال الجزائر؟', ['1954', '1962', '1970', '1958'], 1),
  QA('لغة تُكتب من اليمين لليسار غير العربية؟', ['الإنجليزية', 'الروسية', 'العبرية', 'الإسبانية'], 2),
  QA('أعلى قمة في العالم؟', ['كي2', 'إيفرست', 'مون بلان', 'كليمنجارو'], 1),
  QA('المحيط الذي يطل على المغرب؟', ['الأطلسي', 'الهندي', 'المتجمد', 'الهادئ'], 0),
  QA('غاز ضروري للتنفس؟', ['ثاني أكسيد الكربون', 'الأكسجين', 'النيتروجين', 'الهيدروجين'], 1),
  QA('العالم الذي وضع النسبية؟', ['نيوتن', 'أينشتاين', 'ماكسويل', 'بلانك'], 1),
  QA('عاصمة تركيا؟', ['إسطنبول', 'أنقرة', 'إزمير', 'بورصة'], 1),
  QA('منظمة الصحة العالمية مقرّها؟', ['نيويورك', 'جنيف', 'لندن', 'فيينا'], 1),
  QA('عدد الكواكب (حسب الاتحاد الفلكي)؟', ['7', '8', '9', '10'], 1),
  QA('العضو المسؤول عن ضخ الدم؟', ['الرئتان', 'المعدة', 'القلب', 'الكبد'], 2),
  QA('سورة في القرآن تسمى قلب القرآن؟', ['يس', 'الرحمن', 'البقرة', 'الكهف'], 0),
  QA('أكبر دولة عربية مساحة؟', ['الجزائر', 'السعودية', 'السودان', 'ليبيا'], 0),
  QA('عدد أضلاع المثلث؟', ['2', '3', '4', '5'], 1),
  QA('عالم الشفرة الإنجليزي بالحرب العالمية؟', ['تورينغ', 'بوخنر', 'هايزنبرغ', 'فاراداي'], 0),
  QA('قناة تربط الأحمر والمتوسط؟', ['بنما', 'المانش', 'السويس', 'البوسفور'], 2),
  QA('مدينة أوروبية على نهر السين؟', ['روما', 'باريس', 'مدريد', 'فيينا'], 1),
  QA('سنة هبوط الإنسان على القمر؟', ['1965', '1969', '1971', '1975'], 1),
  QA('أول من طبع النقود الورقية؟', ['العرب', 'الصينيون', 'الرومان', 'الفُرس'], 1),
  QA('منشأ الأولمبياد القديم؟', ['اليونان', 'روما', 'مصر', 'الصين'], 0),
  QA('عاصمة النمسا؟', ['براغ', 'فيينا', 'بودابست', 'زيورخ'], 1),
  QA('المادة التي تكوّن الأظافر؟', ['كيراتين', 'كولاجين', 'ميلانين', 'غلوكين'], 0),
  QA('العقد الذي فيه الحرب العالمية الثانية؟', ['1920s', '1930s', '1940s', '1950s'], 2),
  QA('عدد كيلومترات الماراثون تقريبًا؟', ['21', '30', '42', '50'], 2),
  QA('عاصمة كندا؟', ['تورونتو', 'أوتاوا', 'مونتريال', 'فانكوفر'], 1),
  QA('مكتشف الدوران حول الشمس (دعمًا علميًا)؟', ['كوبرنيكوس', 'نيوتن', 'داروين', 'بطليموس'], 0),
  QA('سورة أطول في القرآن؟', ['آل عمران', 'النساء', 'البقرة', 'المائدة'], 2),
  QA('جهاز قياس الزلازل؟', ['بارومتر', 'سيزمومتر', 'ثرمومتر', 'هيدrometer'], 1),
  QA('أكبر بحيرة عذبة؟', ['بحيرة بايكال', 'فكتوريا', 'سوبرير', 'قزوين'], 2),
  QA('عاصمة نيجيريا؟', ['لاگوس', 'أبوجا', 'كانو', 'إيبادان'], 1),
  QA('مخترع الهاتف؟', ['ماركوني', 'غراهام بيل', 'تسلا', 'أديسون'], 1),
  QA('مدينة الأندلس التاريخية؟', ['غرناطة', 'ليون', 'مرسيليا', 'تورينو'], 0),
  QA('صخر رسوبي؟', ['البازلت', 'الجرانيت', 'الحجر الرملي', 'الأنديزيت'], 2),
  QA('عظمة في الذراع؟', ['القص', 'العضد', 'الرضفة', 'الزند'], 1),
  QA('الغاز الأكثر في الهواء؟', ['أكسجين', 'نيتروجين', 'أرغون', 'ثاني أكسيد الكربون'], 1),
  QA('لغة البرازيل الرسمية؟', ['الإسبانية', 'البرتغالية', 'الفرنسية', 'الهولندية'], 1),
  QA('نتيجة 12 × 11؟', ['121', '122', '132', '144'], 2),
  QA('عاصمة السويد؟', ['أوسلو', 'ستوكهولم', 'كوبنهاغن', 'هلسنكي'], 1),
  QA('نهر في مصر؟', ['الأمازون', 'النيل', 'الدانوب', 'الراين'], 1),
  QA('ثاني أكبر قارة؟', ['أفريقيا', 'أمريكا الجنوبية', 'أوروبا', 'أستراليا'], 0),
  QA('سلسلة جبال في المغرب العربي؟', ['الأطلس', 'الهيمالايا', 'الألب', 'الأنديز'], 0),
];

// أسئلة صعبة (40)
const List<QA> hard = [
  QA('العالم الذي صاغ معادلة E=mc²؟', ['نيوتن', 'أينشتاين', 'ماكسويل', 'بلانك'], 1),
  QA('الدولة التي تضم بركان فيزوف؟', ['إسبانيا', 'إيطاليا', 'اليونان', 'تركيا'], 1),
  QA('مكتشف البنسلين؟', ['راذرفورد', 'فليمنغ', 'كوري', 'باستور'], 1),
  QA('معركة القادسية كانت ضد؟', ['البيزنطيين', 'الفرس', 'المغول', 'الصليبيين'], 1),
  QA('أعمق نقطة في المحيط الهادئ؟', ['خندق ماريانا', 'خندق تونغا', 'خندق كوريل', 'خندق كيرماديك'], 0),
  QA('قانون يصف الكهرباء والمغناطيسية؟', ['قوانين كبلر', 'معادلات ماكسويل', 'قانون أوم', 'قانون نيوتن الثاني'], 1),
  QA('منشأ الفلسفة الرواقية؟', ['روما', 'أثينا', 'الإسكندرية', 'قرطاجة'], 1),
  QA('عنصر عدده الذري 26؟', ['حديد', 'زنك', 'نحاس', 'كروم'], 0),
  QA('رأس المال لآدم سميث صدر عام؟', ['1750', '1776', '1799', '1812'], 1),
  QA('أكبر صحراء بعد القطبين؟', ['الصحراء الكبرى', 'جوبي', 'سهارا الوسطى', 'كالاهاري'], 0),
  QA('عاصمة كازاخستان الحالية؟', ['ألماتy', 'نور سلطان/أستانا', 'طشقند', 'بيشكيك'], 1),
  QA('المركّب المسؤول عن الوراثة؟', ['RNA', 'DNA', 'بروتين', 'ليبيد'], 1),
  QA('الكونتinent الذي يضم سور الصين؟', ['أوروبا', 'أفريقيا', 'آسيا', 'أمريكا'], 2),
  QA('قائد مغولي غزا بغداد 1258؟', ['جنكيز خان', 'قبلاي', 'هولاكو', 'تيمور'], 2),
  QA('نظرية الصفائح التكتونية تتعلق بـ؟', ['الغلاف الجوي', 'القشرة الأرضية', 'المحيطات', 'المجال الحيوي'], 1),
  QA('الفيتامين الضروري للرؤية الليلية؟', ['A', 'B12', 'C', 'K'], 0),
  QA('العالم الذي اكتشف دوران المريخ غير تام الدائرية؟', ['كبلر', 'غاليلو', 'نيوتن', 'تيخو براهي'], 0),
  QA('ظاهرة النينيو مرتبطة بـ؟', ['المحيط الهندي', 'الهادي', 'الأطلسي', 'المتجمد'], 1),
  QA('مؤلف الأمير؟', ['ميكافيللي', 'روسو', 'هوبز', 'لوك'], 0),
  QA('عدد العظام لدى البالغ تقريبًا؟', ['186', '206', '226', '256'], 1),
  QA('عنصر يُستخدم في شاشات العرض قديمًا (أشعة مهبطية)؟', ['السيزيوم', 'الكروم', 'الفوسفور', 'النيون'], 2),
  QA('مدينة عربية تُعرف بمدينة العلم والعلماء تاريخيًا؟', ['القيروان', 'فاس', 'بغداد', 'دمشق'], 2),
  QA('أول حاسوب إلكتروني عام؟', ['ENIAC', 'UNIVAC', 'Colossus', 'IBM 360'], 0),
  QA('العمود الدوري الذي يضم الفلزات القلوية؟', ['1', '2', '17', '18'], 0),
  QA('مستوى الحموضة للماء النقي pH ≈؟', ['5', '6', '7', '8'], 2),
  QA('مَن وراء تجربة الشق المزدوج بالضوء؟', ['فاراداي', 'يونغ', 'بلانك', 'بوهر'], 1),
  QA('البادئة المترية لـ 10^-6؟', ['نانو', 'مايكرو', 'بيكو', 'ميلي'], 1),
  QA('عاصمة إثيوبيا؟', ['أديس أبابا', 'هراري', 'نيروبي', 'كمبالا'], 0),
  QA('أقدم جامعة في العالم تعمل حتى اليوم (خلافًا للمدارس)؟', ['أكسفورد', 'القرويين', 'بولونيا', 'الأزهر'], 1),
  QA('مخترع الدينامو؟', ['فاراداي', 'تسلا', 'إديسون', 'مكسويل'], 0),
  QA('العالم الذي قاس سرعة الضوء بدقة مبكرة؟', ['فيزو', 'غاليلو', 'هويغنز', 'فريق ميكلسون'], 3),
  QA('الكاتب الجزائري نوبل 1957؟', ['الطاهر وطّار', 'أحلام مستغانمي', 'كاتب ياسين', 'ألبير كامو'], 3),
  QA('أكبر دلتا نهرية؟', ['دلتا النيل', 'دلتا الغانج-براهمابوترا', 'دلتا الأمازون', 'دلتا اليانغتسي'], 1),
  QA('عدد الأبعاد في النسبية الخاصة؟', ['3', '4', '5', '10'], 1),
  QA('غاز يسبب الاحتباس الحراري بقوة؟', ['أكسجين', 'نيتروجين', 'ميثان', 'أرغون'], 2),
  QA('معركة العلمين في أي بلد؟', ['تونس', 'مصر', 'ليبيا', 'الجزائر'], 1),
  QA('منشأ القهوة التاريخي؟', ['اليمن/الحبشة', 'تركيا', 'إيطاليا', 'البرازيل'], 0),
  QA('طبقة الأوزون تقع في؟', ['التروبوسفير', 'الستراتوسفير', 'الميزوسفير', 'الثيرموسفير'], 1),
  QA('جهاز قياس الرطوبة؟', ['بارومتر', 'هيغروميتر', 'ألتيميتر', 'أنيمومتر'], 1),
  QA('مَن صاغ ميكانيكا الكم المصفوفية؟', ['شرودنغر', 'هايزنبرغ', 'دي برولي', 'ديراك'], 1),
];

/* ================ منطق اختيار السؤال حسب المرحلة ================ */

QA getQuestionForLevel(int level, Random rnd) {
  // 1–100 سهل، 101–300 متوسط، 301–500 صعب
  if (level <= 100) {
    return easy[rnd.nextInt(easy.length)];
  } else if (level <= 300) {
    return medium[rnd.nextInt(medium.length)];
  } else if (level <= 500) {
    return hard[rnd.nextInt(hard.length)];
  }
  // بعد 500: نولّد سؤالًا حسابيًا أو نخلط من جميع القوائم
  if (rnd.nextBool()) {
    // توليد حسابي بسيط/متوسط/صعب بحسب المستوى
    int a = rnd.nextInt(50) + (level ~/ 20);
    int b = rnd.nextInt(50) + (level ~/ 20);
    final ops = ['+', '−', '×'];
    final op = ops[rnd.nextInt(ops.length)];
    int correct;
    if (op == '+') correct = a + b;
    else if (op == '−') correct = a - b;
    else correct = a * (b % 13 + 2);
    final set = <int>{correct};
    while (set.length < 4) {
      set.add(correct + rnd.nextInt(11) - 5);
    }
    final opts = set.toList()..shuffle(rnd);
    return QA('ما حاصل: $a $op $b ؟', opts.map((e) => '$e').toList(), opts.indexOf('$correct'));
  } else {
    final all = [...easy, ...medium, ...hard];
    return all[rnd.nextInt(all.length)];
  }
}

/* =============================== الحالة =============================== */

class GameState {
  int coins;        // عملات للمهارات
  int cashCoins;    // عملة قابلة للاستبدال
  int currentLevel; // يبدأ من 1

  GameState({required this.coins, required this.cashCoins, required this.currentLevel});

  static const _kCoins = 'coins';
  static const _kCash = 'cashCoins';
  static const _kLevel = 'currentLevel';

  static Future<GameState> load() async {
    final p = await SharedPreferences.getInstance();
    return GameState(
      coins: p.getInt(_kCoins) ?? 50,
      cashCoins: p.getInt(_kCash) ?? 0,
      currentLevel: p.getInt(_kLevel) ?? 1,
    );
  }

  Future<void> save() async {
    final p = await SharedPreferences.getInstance();
    await p.setInt(_kCoins, coins);
    await p.setInt(_kCash, cashCoins);
    await p.setInt(_kLevel, currentLevel);
  }
}

/* =============================== الواجهة =============================== */

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<GameState> _state;

  @override
  void initState() {
    super.initState();
    _state = GameState.load();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GameState>(
      future: _state,
      builder: (context, s) {
        if (!s.hasData) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        final state = s.data!;
        return Scaffold(
          appBar: AppBar(
            title: const Text('ثقافتي مالي'),
            actions: [
              IconButton(
                tooltip: 'محفظتي',
                icon: const Icon(Icons.account_balance_wallet_outlined),
                onPressed: () async {
                  await Navigator.push(context, MaterialPageRoute(builder: (_) => WalletScreen(state: state)));
                  setState(() {});
                },
              ),
              IconButton(
                tooltip: 'استبدال',
                icon: const Icon(Icons.attach_money),
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => const RedeemDialog(),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _statsRow(state),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: 20, // عرض 20 مرحلة حول الحالية للتنقل السريع
                    itemBuilder: (c, i) {
                      final level = max(1, state.currentLevel - 5) + i;
                      return _levelTile(level, enabled: level <= state.currentLevel);
                    },
                  ),
                ),
                const SizedBox(height: 8),
                FilledButton(
                  onPressed: () async {
                    await Navigator.push(context, MaterialPageRoute(builder: (_) => LevelScreen(state: state)));
                    setState(() {});
                  },
                  child: Text('ابدأ المرحلة ${state.currentLevel}'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _statsRow(GameState s) {
    return Row(
      children: [
        Expanded(child: _badge(Icons.monetization_on_outlined, 'عملات', s.coins.toString())),
        const SizedBox(width: 8),
        Expanded(child: _badge(Icons.savings_outlined, 'نقدية', s.cashCoins.toString())),
        const SizedBox(width: 8),
        Expanded(child: _badge(Icons.flag_outlined, 'المرحلة', '${s.currentLevel}')),
      ],
    );
  }

  Widget _badge(IconData i, String l, String v) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Row(
        children: [
          Icon(i),
          const SizedBox(width: 8),
          Expanded(child: Text(l)),
          Text(v, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _levelTile(int level, {required bool enabled}) {
    return Card(
      child: ListTile(
        title: Text('المرحلة $level'),
        subtitle: Text(level <= 100 ? 'سهل' : level <= 300 ? 'متوسط' : level <= 500 ? 'صعب' : 'متقدم'),
        trailing: Icon(enabled ? Icons.play_arrow_rounded : Icons.lock_outline),
        onTap: enabled
            ? () async {
                final st = await GameState.load();
                st.currentLevel = level;
                await st.save();
                if (!mounted) return;
                await Navigator.push(context, MaterialPageRoute(builder: (_) => LevelScreen(state: st)));
                setState(() {});
              }
            : null,
      ),
    );
  }
}

class LevelScreen extends StatefulWidget {
  final GameState state;
  const LevelScreen({super.key, required this.state});
  @override
  State<LevelScreen> createState() => _LevelScreenState();
}

class _LevelScreenState extends State<LevelScreen> {
  late QA qa;
  int? selected;
  bool answered = false;
  late Random rnd;

  @override
  void initState() {
    super.initState();
    rnd = Random(widget.state.currentLevel);
    qa = getQuestionForLevel(widget.state.currentLevel, rnd);
  }

  void _useHint() {
    if (widget.state.coins < 10 || answered) {
      _toast(context, 'تحتاج 10 عملات لاستخدام تلميح');
      return;
    }
    // حذف خيار خاطئ
    final wrongs = <int>[];
    for (int i = 0; i < qa.options.length; i++) {
      if (i != qa.correct) wrongs.add(i);
    }
    if (wrongs.isEmpty) return;
    wrongs.shuffle(rnd);
    final toRemove = wrongs.first;
    final newOpts = <String>[];
    int newCorrect = qa.correct;
    for (int i = 0; i < qa.options.length; i++) {
      if (i == toRemove) continue;
      newOpts.add(qa.options[i]);
      if (i < qa.correct) {
        newCorrect--;
      }
    }
    setState(() {
      widget.state.coins -= 10;
      qa = QA(qa.q, newOpts, newCorrect);
    });
    widget.state.save();
  }

  void _useSkip() async {
    if (widget.state.coins < 20 || answered) {
      _toast(context, 'تحتاج 20 عملة لتخطي المرحلة');
      return;
    }
    widget.state.coins -= 20;
    await _win(skipRewards: true);
  }

  Future<void> _win({bool skipRewards = false}) async {
    if (!skipRewards) {
      // مكافآت تتدرج مع الصعوبة
      int rewardCoins = widget.state.currentLevel <= 100
          ? 5
          : widget.state.currentLevel <= 300
              ? 8
              : widget.state.currentLevel <= 500
                  ? 12
                  : 15;
      int rewardCash = (widget.state.currentLevel % 5 == 0) ? 1 : 0;

      widget.state.coins += rewardCoins;
      widget.state.cashCoins += rewardCash;
    }
    widget.state.currentLevel = widget.state.currentLevel + 1;
    await widget.state.save();

    if (!mounted) return;
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.celebration, size: 56),
          const SizedBox(height: 8),
          const Text('أحسنت! إجابة صحيحة'),
          const SizedBox(height: 8),
          Text('تمت ترقية مرحلتك إلى ${widget.state.currentLevel}'),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('متابعة'),
          )
        ]),
      ),
    );
    if (!mounted) return;
    Navigator.pop(context);
  }

  void _check(int i) {
    if (answered) return;
    setState(() {
      selected = i;
      answered = true;
    });
    Future.delayed(const Duration(milliseconds: 350), () {
      if (i == qa.correct) {
        _win();
      } else {
        _toast(context, 'إجابة خاطئة، حاول مجددًا');
        setState(() {
          selected = null;
          answered = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المرحلة ${widget.state.currentLevel}'),
        actions: [
          IconButton(onPressed: _useHint, tooltip: 'تلميح (10 عملات)', icon: const Icon(Icons.lightbulb_outline)),
          IconButton(onPressed: _useSkip, tooltip: 'تخطي (20 عملة)', icon: const Icon(Icons.skip_next_rounded)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                qa.q,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: qa.options.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (c, i) {
                final isCorrect = i == qa.correct;
                final isSelected = selected == i && answered;
                final bg = !answered
                    ? Colors.white
                    : isSelected
                        ? (isCorrect ? Colors.green.shade100 : Colors.red.shade100)
                        : Colors.white;
                return Material(
                  color: bg,
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    onTap: () => _check(i),
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          CircleAvatar(child: Text(String.fromCharCode(0x41 + i))),
                          const SizedBox(width: 12),
                          Expanded(child: Text(qa.options[i])),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ]),
      ),
    );
  }
}

class WalletScreen extends StatelessWidget {
  final GameState state;
  const WalletScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('محفظتي')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          _tile(Icons.monetization_on_outlined, 'العملات (للمهارات)', '${state.coins}'),
          const SizedBox(height: 10),
          _tile(Icons.savings_outlined, 'العملة النقدية (للاستبدال)', '${state.cashCoins}'),
          const Spacer(),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                Text('ملاحظات الاستبدال:', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('الاستبدال يدويًا عبر مراسلتنا بالبريد داخل اللعبة.'),
                Text('قد يطبق حد أدنى للاستبدال ورسوم تحويل حسب الاتفاق.'),
              ]),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _tile(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Row(children: [
        Icon(icon),
        const SizedBox(width: 12),
        Expanded(child: Text(title)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ]),
    );
  }
}

class RedeemDialog extends StatelessWidget {
  const RedeemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('استبدال بالنقود'),
      content: const Text(
          'عند الوصول إلى الحد الأدنى للاستبدال، راسل البريد التالي:\nNadjibpro23@gmail.com\n\n'
          'أرسل: اسمك/معرّفك داخل اللعبة، رصيدك الحالي من العملة النقدية، ووسيلة التحويل المفضلة.'),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text('إغلاق')),
      ],
    );
  }
}

/* =============================== أدوات مساعدة =============================== */

void _toast(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
