
import 'package:quote_generator/quote_generator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  QuoteModel? _currentQuote;
  bool _isLoading = true;
  bool _hasError = false;
  int _quoteCount = 0;

  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<double> _slideAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 550));

    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _slideAnim = Tween<double>(
      begin: 28,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _loadQuote(isFirst: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadQuote({bool isFirst = false}) async {
    if (!isFirst) await _controller.reverse();

    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final quote = await QuoteService.fetchRandom();
      if (!mounted) return;
      setState(() {
        _currentQuote = quote;
        _isLoading = false;
        if (!isFirst) _quoteCount++;
      });
      await _controller.forward();
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('QUOTABLE', style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 4),
                      Text('live wisdom', style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  CounterBadge(count: _quoteCount),
                ],
              ),
              const Spacer(),
              _buildBody(),
              const Spacer(),
              Column(
                children: [
                  GestureDetector(
                    onTap: _isLoading ? null : () => _loadQuote(),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: _isLoading
                            ? AppTheme.accentColor.withValues(alpha: 0.4)
                            : AppTheme.accentColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: _isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppTheme.bgColor,
                                ),
                              )
                            : Text(
                                'NEW QUOTE',
                                style: TextStyle(
                                  color: AppTheme.bgColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 3.0,
                                  fontFamily: Theme.of(context).textTheme.bodySmall?.fontFamily,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) return LoadingState();
    if (_hasError) return ErrorState(onTap: _loadQuote);
    return QuoteCard(
      quote: _currentQuote!,
      controller: _controller,
      fadeAnim: _fadeAnim,
      slideAnim: _slideAnim,
    );
  }
}
