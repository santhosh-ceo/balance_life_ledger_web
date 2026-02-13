import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';
import '../widgets/footer.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  int _currentIndex = 4;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool _isSubmitting = false;

  void _navigateTo(int index) {
    setState(() => _currentIndex = index);
    final routes = ['/home', '/products', '/values', '/about', '/contact'];
    if (index < routes.length) Navigator.pushNamed(context, routes[index]);
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      setState(() => _isSubmitting = false);
      _showSuccessDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Dialog(
          backgroundColor: BalanceColors.surfaceDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
            side: BorderSide(color: Colors.white.withOpacity(0.1)),
          ),
          child: Container(
            padding: const EdgeInsets.all(40),
            width: 450,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.greenAccent,
                  size: 80,
                ),
                const SizedBox(height: 24),
                const Text(
                  "Message Sent",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "We've received your inquiry. Expect a response from Balance Labs within 24 hours.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: BalanceColors.textSecondary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _nameController.clear();
                    _emailController.clear();
                    _messageController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: BalanceColors.ledgerPrimary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Done",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 950;

    return Scaffold(
      backgroundColor: BalanceColors.backgroundDark,
      extendBodyBehindAppBar: true,
      appBar: BalanceAppBar(
        isTransparent: true,
        currentIndex: _currentIndex,
        onItemTapped: _navigateTo,
      ),
      endDrawer: BalanceDrawer(
        currentIndex: _currentIndex,
        onNavigate: _navigateTo,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- HERO ---
            _buildHero(isMobile),

            // --- CONTACT SECTION ---
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : 80),
              child: isMobile
                  ? Column(
                      children: [
                        _buildContactInfo(isMobile),
                        const SizedBox(height: 60),
                        _buildForm(),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildContactInfo(isMobile)),
                        const SizedBox(width: 80),
                        Expanded(child: _buildForm()),
                      ],
                    ),
            ),

            // --- FAQ SECTION ---
            _buildFAQSection(isMobile),

            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHero(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(24, isMobile ? 120 : 180, 24, 100),
      child: Column(
        children: [
          const Text(
            "Get in Touch",
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Whether it's feedback or a partnership, we're here to listen.",
            style: TextStyle(color: BalanceColors.textSecondary, fontSize: 18),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ContactInfoCard(
          icon: Icons.email_rounded,
          title: "Email",
          description: "General & Support",
          value: "info@anakramy.com",
          color: BalanceColors.ledgerPrimary,
          onTap: () {},
        ),
        const SizedBox(height: 24),
        _ContactInfoCard(
          icon: Icons.phone_rounded,
          title: "Phone",
          description: "WhatsApp & Business",
          value: "+91 9739225131",
          color: BalanceColors.focusPrimary,
          onTap: () {},
        ),
        const SizedBox(height: 48),
        _buildBusinessHours(),
      ],
    );
  }

  Widget _buildBusinessHours() {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: const Column(
        children: [
          _BusinessHourRow(day: "Mon - Fri", time: "9:00 AM - 6:00 PM"),
          Divider(color: Colors.white10, height: 32),
          _BusinessHourRow(day: "Saturday", time: "10:00 AM - 2:00 PM"),
          Divider(color: Colors.white10, height: 32),
          _BusinessHourRow(day: "Sunday", time: "Closed"),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: BalanceColors.surfaceDark.withOpacity(0.5),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _buildTextField("Your Name", _nameController, Icons.person_outline),
            const SizedBox(height: 24),
            _buildTextField(
              "Email Address",
              _emailController,
              Icons.email_outlined,
            ),
            const SizedBox(height: 24),
            _buildTextField(
              "Message",
              _messageController,
              Icons.chat_bubble_outline,
              maxLines: 5,
            ),
            const SizedBox(height: 40),
            _buildSubmitButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    IconData icon, {
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white54),
        prefixIcon: Icon(icon, color: BalanceColors.ledgerPrimary),
        filled: true,
        fillColor: Colors.black26,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: BalanceColors.ledgerPrimary),
        ),
      ),
      validator: (v) => v!.isEmpty ? "Required" : null,
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isSubmitting ? null : _submitForm,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 24),
          backgroundColor: BalanceColors.ledgerPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: _isSubmitting
            ? const CircularProgressIndicator(color: Colors.white)
            : const Text(
                "Send Message",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }

  Widget _buildFAQSection(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: Column(
        children: [
          const Text(
            "Frequently Asked",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: const Column(
              children: [
                _FAQItem(
                  question: "When will the apps launch?",
                  answer:
                      "Life Ledger, Focus Restore, and Wealth Tracker are set for a staggered release in Q2 2026. Join the waitlist for early access.",
                ),
                SizedBox(height: 16),
                _FAQItem(
                  question: "Is my financial data safe?",
                  answer:
                      "Yes. Our Wealth Tracker uses local encryption and secure legend processing. We never sell your personal data.",
                ),
                SizedBox(height: 16),
                _FAQItem(
                  question: "Will there be a free tier?",
                  answer:
                      "Absolutely. All three apps feature a free-forever tier with core features like 24-hour journaling and 10-category wealth tracking.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- SUB-WIDGETS ---

class _ContactInfoCard extends StatelessWidget {
  final IconData icon;
  final String title, description, value;
  final Color color;
  final VoidCallback onTap;

  const _ContactInfoCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.value,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(value, style: TextStyle(color: BalanceColors.textSecondary)),
            ],
          ),
        ],
      ),
    );
  }
}

class _BusinessHourRow extends StatelessWidget {
  final String day, time;
  const _BusinessHourRow({required this.day, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(day, style: const TextStyle(color: Colors.white70)),
        Text(
          time,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _FAQItem extends StatefulWidget {
  final String question, answer;
  const _FAQItem({required this.question, required this.answer});

  @override
  State<_FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<_FAQItem> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: _expanded
              ? Colors.white.withOpacity(0.05)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.05)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.question,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(
                  _expanded ? Icons.remove : Icons.add,
                  color: BalanceColors.ledgerPrimary,
                ),
              ],
            ),
            if (_expanded)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  widget.answer,
                  style: TextStyle(
                    color: BalanceColors.textSecondary,
                    height: 1.6,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
