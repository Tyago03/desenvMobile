import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Cores principais usadas:
// Plano de fundo: #0E1315
// Cor dos realces: #0DAD9E

void main() => runApp(const MyApp());

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}

class _PerguntaAppState extends State<PerguntaApp> {
  int _currentIndex = 0;

  // Itens da NavBar
  final List<String> _titles = const ['Início', 'Perfil', 'Configurações'];

  // itens das SubAbas
  final List<String> abas = const [
    'Alterar foto',
    'Alterar nome',
    'Editar E-Mail',
    'Trocar Senha',
    'Reconfigurar Voz',
    'Alterar voz da Ayla',
    'Editar Alarmes',
    'Editar Localização'
  ];

  // Guia Principal
  Widget _buildInicioPage() {
    // Aba Início
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 1300,
          height: 150,
          child: Image.asset('assets/images/logomarcabranco.png'),
        ),
        const SizedBox(height: 50),
        Text(
          'Olá, Tyago',
          style: GoogleFonts.josefinSans(fontSize: 30, color: Colors.white),
        ),
        const SizedBox(height: 20),
        Text(
          'Como posso te ajudar hoje?',
          style: GoogleFonts.josefinSans(fontSize: 24, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 50),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: IconButton(
            icon: const Icon(Icons.mic),
            iconSize: 60,
            color: Colors.white,
            onPressed: () {
              // Ação botão de voz
            },
          ),
        ),
      ],
    );
  }

  // Aba Perfil
  Widget _buildPerfilPage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(color: Colors.white, width: 4),
          ),
          child: const Icon(Icons.person, size: 80, color: Colors.white),
        ),
        const SizedBox(height: 25),
        Text(
          'Selecione a opção desejada:',
          style: GoogleFonts.josefinSans(fontSize: 22, color: Colors.white),
        ),
        const SizedBox(height: 30),
        OutlinedButton(
          // Botão para a Sub-Aba Editar foto de Perfil
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => _buildAlterarFoto()));
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.white.withOpacity(0.1),
            side: const BorderSide(color: Colors.white, width: 2),
            textStyle: GoogleFonts.josefinSans(fontSize: 20),
            minimumSize: const Size(240, 48),
          ),
          child: const Text('Editar foto de perfil'),
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          // Botão para a Sub-Aba Editar Nome
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => _buildAlterarNome()));
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.white.withOpacity(0.1),
            side: const BorderSide(color: Colors.white, width: 2),
            textStyle: GoogleFonts.josefinSans(fontSize: 20),
            minimumSize: const Size(240, 48),
          ),
          child: const Text('Editar Nome'),
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          // Botão para a Sub-Aba Editar E-Mail
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => _buildEditarEmail()));
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.white.withOpacity(0.1),
            side: const BorderSide(color: Colors.white, width: 2),
            textStyle: GoogleFonts.josefinSans(fontSize: 20),
            minimumSize: const Size(240, 48),
          ),
          child: const Text('Editar E-Mail'),
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          // Botão para a Sub-Aba Editar Senha
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => _buildTrocarSenha()));
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.white.withOpacity(0.1),
            side: const BorderSide(color: Colors.white, width: 2),
            textStyle: GoogleFonts.josefinSans(fontSize: 20),
            minimumSize: const Size(240, 48),
          ),
          child: const Text('Editar Senha'),
        ),
        const SizedBox(height: 50),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF0DAD9E),
            textStyle: const TextStyle(decoration: TextDecoration.underline),
          ),
          child: const Text('Sair da Conta',
              style: TextStyle(color: Color(0xFF0DAD9E), fontSize: 16)),
        ),
      ],
    );
  }

  //Sub-Aba Alterar Foto
  Widget _buildAlterarFoto() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0E1315),
        title: Text(
          'Alterar Foto',
          style: GoogleFonts.josefinSans(color: Colors.white, fontSize: 28),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Container(
            color: Color(0xFF0DAD9E),
            height: 4.0,
          ),
        ),
      ),
      backgroundColor: Color(0xFF0E1315),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 60),
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.white.withOpacity(0.1),
                side: BorderSide(color: Colors.white, width: 2),
                textStyle: GoogleFonts.josefinSans(fontSize: 20),
                minimumSize: Size(240, 48),
              ),
              child: const Text('Concluído'),
            ),
          ],
        ),
      ),
    );
  }

  //Sub-Aba Alterar Nome
  Widget _buildAlterarNome() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        //Top Bar
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0E1315),
            border: Border(
              bottom: BorderSide(color: Color(0xFF0DAD9E), width: 1.6),
            ),
          ),
          child: AppBar(
            title: Text(
              'Alterar Nome',
              style: GoogleFonts.josefinSans(color: Colors.white, fontSize: 28),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF0E1315),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 1300,
                height: 100,
                child: Image.asset('assets/images/aylabrancoc.png'),
              ),
              Text(
                "Assistente Virtual",
                style:
                    GoogleFonts.josefinSans(fontSize: 28, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const TextField(
                cursorColor: Colors.white,
                obscureText: true, // Para entrada de senha
                decoration: InputDecoration(
                  labelText: 'Nome',
                  labelStyle: TextStyle(color: Color(0xFF0DAD9E)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0DAD9E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF0DAD9E), width: 2.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              const TextField(
                cursorColor: Colors.white,
                obscureText: true, // Para repetir a entrada da senha
                decoration: InputDecoration(
                  labelText: 'Sobrenome',
                  labelStyle: TextStyle(color: Color(0xFF0DAD9E)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0DAD9E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF0DAD9E), width: 2.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  elevation: 0,
                  minimumSize: const Size(200, 48),
                ),
                child: Text('Concluido',
                    style: GoogleFonts.josefinSans(fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );
  }

  //Sub-Aba Editar E-Mail
  Widget _buildEditarEmail() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        //Top Bar
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0E1315),
            border: Border(
              bottom: BorderSide(color: Color(0xFF0DAD9E), width: 1.6),
            ),
          ),
          child: AppBar(
            title: Text(
              'Alterar E-Mail',
              style: GoogleFonts.josefinSans(color: Colors.white, fontSize: 28),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF0E1315),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 1300,
                height: 100,
                child: Image.asset('assets/images/aylabrancoc.png'),
              ),
              Text(
                "Assistente Virtual",
                style:
                    GoogleFonts.josefinSans(fontSize: 28, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const TextField(
                cursorColor: Colors.white,
                obscureText: true, // Para entrada de senha
                decoration: InputDecoration(
                  labelText: 'Novo E-Mail',
                  labelStyle: TextStyle(color: Color(0xFF0DAD9E)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0DAD9E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF0DAD9E), width: 2.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              const TextField(
                cursorColor: Colors.white,
                obscureText: true, // Para repetir a entrada da senha
                decoration: InputDecoration(
                  labelText: 'Confirme o E-Mail',
                  labelStyle: TextStyle(color: Color(0xFF0DAD9E)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0DAD9E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF0DAD9E), width: 2.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  elevation: 0,
                  minimumSize: const Size(200, 48),
                ),
                child: Text('Concluido',
                    style: GoogleFonts.josefinSans(fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );
  }

  //Sub-Aba Editar Senha
  Widget _buildTrocarSenha() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        //Top Bar
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0E1315),
            border: Border(
              bottom: BorderSide(color: Color(0xFF0DAD9E), width: 1.6),
            ),
          ),
          child: AppBar(
            title: Text(
              'Alterar Senha',
              style: GoogleFonts.josefinSans(color: Colors.white, fontSize: 28),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF0E1315),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 1300,
                height: 100,
                child: Image.asset('assets/images/aylabrancoc.png'),
              ),
              Text(
                "Assistente Virtual",
                style:
                    GoogleFonts.josefinSans(fontSize: 28, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const TextField(
                cursorColor: Colors.white,
                obscureText: true, // Para entrada de senha
                decoration: InputDecoration(
                  labelText: 'Nova Senha',
                  labelStyle: TextStyle(color: Color(0xFF0DAD9E)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0DAD9E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF0DAD9E), width: 2.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              const TextField(
                cursorColor: Colors.white,
                obscureText: true, // Para repetir a entrada da senha
                decoration: InputDecoration(
                  labelText: 'Confirme a Senha',
                  labelStyle: TextStyle(color: Color(0xFF0DAD9E)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0DAD9E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF0DAD9E), width: 2.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  elevation: 0,
                  minimumSize: const Size(200, 48),
                ),
                child: Text('Concluido',
                    style: GoogleFonts.josefinSans(fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Aba Configurações
  Widget _buildConfiguracoesPage() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(color: Colors.white, width: 4),
          ),
          child: const Icon(Icons.settings, size: 80, color: Colors.white),
        ),
        const SizedBox(height: 25),
        Text(
          'Selecione a opção desejada:',
          style: GoogleFonts.josefinSans(fontSize: 22, color: Colors.white),
        ),
        const SizedBox(height: 30),
        OutlinedButton(
          // Botão para a Sub-Aba Reconfigurar Voz
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => _buildReconfigurarVoz()));
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.white.withOpacity(0.1),
            side: const BorderSide(color: Colors.white, width: 2),
            textStyle: GoogleFonts.josefinSans(fontSize: 20),
            minimumSize: const Size(240, 48),
          ),
          child: const Text('Reconfigurar sua voz'),
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          // Botão para a Sub-Aba Alterar Voz da Ayla
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => _buildAlterarVozAyla()));
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.white.withOpacity(0.1),
            side: const BorderSide(color: Colors.white, width: 2),
            textStyle: GoogleFonts.josefinSans(fontSize: 20),
            minimumSize: const Size(240, 48),
          ),
          child: const Text('Alterar voz da Ayla'),
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          // Botão para a Sub-Aba Editar Alarmes
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => _buildEditarAlarmes()));
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.white.withOpacity(0.1),
            side: const BorderSide(color: Colors.white, width: 2),
            textStyle: GoogleFonts.josefinSans(fontSize: 20),
            minimumSize: const Size(240, 48),
          ),
          child: const Text('Editar Alarmes'),
        ),
        const SizedBox(height: 20),
        OutlinedButton(
          // Botão para a Sub-Aba Editar Localização
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => _buildEditarLocalizacao()));
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.white.withOpacity(0.1),
            side: const BorderSide(color: Colors.white, width: 2),
            textStyle: GoogleFonts.josefinSans(fontSize: 20),
            minimumSize: const Size(240, 48),
          ),
          child: const Text('Editar Localização'),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  //Sub-Aba Reconfigurar Voz
  Widget _buildReconfigurarVoz() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        //Top Bar
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0E1315),
            border: Border(
              bottom: BorderSide(color: Color(0xFF0DAD9E), width: 1.6),
            ),
          ),
          child: AppBar(
            title: Text(
              'Reconfigurar sua Voz',
              style: GoogleFonts.josefinSans(color: Colors.white, fontSize: 28),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF0E1315),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 1300,
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  elevation: 0,
                  minimumSize: const Size(200, 48),
                ),
                child: Text('Concluido',
                    style: GoogleFonts.josefinSans(fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );
  }

  //Sub-Aba Reconfigurar Voz da Ayla
  Widget _buildAlterarVozAyla() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0E1315),
            border: Border(
              bottom: BorderSide(color: Color(0xFF0DAD9E), width: 1.6),
            ),
          ),
          child: AppBar(
            title: Text(
              'Alterar voz da Ayla',
              style: GoogleFonts.josefinSans(color: Colors.white, fontSize: 28),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF0E1315),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 1300,
                height: 100,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  elevation: 0,
                  minimumSize: const Size(200, 48),
                ),
                child: Text('Concluido',
                    style: GoogleFonts.josefinSans(fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );
  }

  //Sub-Aba Editar Alarmes
  Widget _buildEditarAlarmes() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0E1315),
            border: Border(
              bottom: BorderSide(color: Color(0xFF0DAD9E), width: 1.6),
            ),
          ),
          child: AppBar(
            title: Text(
              'Editar Alarmes',
              style: GoogleFonts.josefinSans(color: Colors.white, fontSize: 28),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF0E1315),
    );
  }

  //Sub-Aba Editar Localização
  Widget _buildEditarLocalizacao() {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0E1315),
            border: Border(
              bottom: BorderSide(color: Color(0xFF0DAD9E), width: 1.6),
            ),
          ),
          child: AppBar(
            title: Text(
              'Editar Alarmes',
              style: GoogleFonts.josefinSans(color: Colors.white, fontSize: 28),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            elevation: 0,
          ),
        ),
      ),
      backgroundColor: const Color(0xFF0E1315),
    );
  }

  // Sistema para mudar de Aba
  Widget _getCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return _buildInicioPage();
      case 1:
        return _buildPerfilPage();
      case 2:
        return _buildConfiguracoesPage();
      case 3:
        return _buildAlterarFoto();
      case 4:
        return _buildAlterarNome();
      case 5:
        return _buildEditarEmail();
      case 6:
        return _buildTrocarSenha();
      case 7:
        return _buildReconfigurarVoz();
      case 8:
        return _buildAlterarVozAyla();
      case 9:
        return _buildEditarAlarmes();
      case 10:
        return _buildEditarLocalizacao();
      default:
        return _buildInicioPage();
    }
  }

  // NavBar e TopBar
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          //Top Bar
          child: Container(
            decoration: const BoxDecoration(
              color: Color(0xFF0E1315),
              border: Border(
                bottom: BorderSide(color: Color(0xFF0DAD9E), width: 1.6),
              ),
            ),
            child: AppBar(
              title: Text(
                _titles[_currentIndex],
                style:
                    GoogleFonts.josefinSans(color: Colors.white, fontSize: 28),
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
            ),
          ),
        ),
        backgroundColor: const Color(0xFF0E1315),

        body: Center(
          child: _getCurrentPage(),
        ),

        //Navigation Bar
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF0E1315),
            border: Border(
              top: BorderSide(color: Color(0xFF0DAD9E), width: 1.5),
            ),
          ),
          child: BottomNavigationBar(
            iconSize: 40,
            backgroundColor: const Color(0xFF0E1315),
            currentIndex: _currentIndex,
            onTap: (int newIndex) {
              setState(() {
                _currentIndex = newIndex;
              });
            },
            items: const [
              BottomNavigationBarItem(
                label: 'Início',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Perfil',
                icon: Icon(Icons.person),
              ),
              BottomNavigationBarItem(
                label: 'Configurações',
                icon: Icon(Icons.settings),
              ),
            ],
            selectedItemColor: const Color(0xFF0DAD9E),
            unselectedItemColor: Colors.grey[600],
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ),
      ),
    );
  }
}

// Guia Cadastro Concluído
class RegistrationCompletePage extends StatelessWidget {
  const RegistrationCompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1315),
        title: Text('Cadastro Concluído',
            style: GoogleFonts.josefinSans(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 1300,
              height: 100,
              child: Image.asset('assets/images/aylabrancoc.png'),
            ),
            Text(
              "Assistente Virtual",
              style: GoogleFonts.josefinSans(fontSize: 28, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Text(
              "Obrigado por se cadastrar!",
              style: GoogleFonts.josefinSans(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white, width: 2),
                elevation: 0,
                minimumSize: const Size(200, 48),
              ),
              child: Text("Ir para o Login",
                  style: GoogleFonts.josefinSans(fontSize: 20)),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF0E1315),
    );
  }
}

// Guia de Cadastro
class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1315),
        title: Text('Cadastro',
            style: GoogleFonts.josefinSans(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: 1300,
                height: 100,
                child: Image.asset('assets/images/aylabrancoc.png'),
              ),
              Text(
                "Assistente Virtual",
                style:
                    GoogleFonts.josefinSans(fontSize: 28, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'Nome completo',
                  labelStyle: TextStyle(color: Color(0xFF0DAD9E)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0DAD9E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF0DAD9E), width: 2.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              const TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Color(0xFF0DAD9E)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0DAD9E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF0DAD9E), width: 2.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              const TextField(
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: 'CEP',
                  labelStyle: TextStyle(color: Color(0xFF0DAD9E)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0DAD9E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF0DAD9E), width: 2.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              const TextField(
                cursorColor: Colors.white,
                obscureText: true, // Para entrada de senha
                decoration: InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Color(0xFF0DAD9E)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0DAD9E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF0DAD9E), width: 2.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              const TextField(
                cursorColor: Colors.white,
                obscureText: true, // Para repetir a entrada da senha
                decoration: InputDecoration(
                  labelText: 'Repetir senha',
                  labelStyle: TextStyle(color: Color(0xFF0DAD9E)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0DAD9E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF0DAD9E), width: 2.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrationCompletePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  elevation: 0,
                  minimumSize: const Size(200, 48),
                ),
                child: Text('Registrar',
                    style: GoogleFonts.josefinSans(fontSize: 20)),
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF0E1315),
    );
  }
}

// Guia Alterar Senha Concluido
class ThankYouPage extends StatelessWidget {
  const ThankYouPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1315),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("Obrigado",
            style: GoogleFonts.josefinSans(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Alinha o conteúdo ao início
          children: <Widget>[
            SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.1), // Reduzir este valor se necessário
            Container(
              width: 1300,
              height: 100,
              child: Image.asset('assets/images/aylabrancoc.png'),
            ),
            Text(
              "Assistente Virtual",
              style: GoogleFonts.josefinSans(fontSize: 28, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Text(
              "Enviamos um link para\n seu E-mail.",
              style: GoogleFonts.josefinSans(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white, width: 2),
                elevation: 0,
                minimumSize: const Size(200, 48),
              ),
              child: Text("Retornar a tela de Login",
                  style: GoogleFonts.josefinSans(fontSize: 20)),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF0E1315),
    );
  }
}

// Guia Esqueci a Senha
class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text("Recuperar Senha",
            style: GoogleFonts.josefinSans(color: Colors.white)),
        backgroundColor: const Color(0xFF0E1315),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 1300,
                height: 100,
                child: Image.asset('assets/images/aylabrancoc.png'),
              ),
              Text(
                "Assistente Virtual",
                style:
                    GoogleFonts.josefinSans(fontSize: 28, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                "Digite seu e-mail para receber as instruções de recuperação de senha.",
                style:
                    GoogleFonts.josefinSans(fontSize: 18, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const TextField(
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(color: Color(0xFF0DAD9E)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0DAD9E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xFF0DAD9E), width: 2.0),
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThankYouPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  elevation: 0,
                  minimumSize: const Size(200, 48),
                ),
                child: Text("Avançar",
                    style: GoogleFonts.josefinSans(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF0E1315),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// Guia de Login
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false; // Controlar a visibilidade da senha

  @override
  Widget build(BuildContext context) {
    Color themeColor =
        const Color(0xFF0DAD9E); // Definição da cor personalizada

    // Tela de login
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 1300,
                height: 100,
                child: Image.asset('assets/images/aylabrancoc.png'),
              ),
              Text(
                "Assistente Virtual",
                style:
                    GoogleFonts.josefinSans(fontSize: 28, color: Colors.white),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                cursorColor: Colors.white, // Cor do cursor
                style: const TextStyle(
                    color: Colors.white), // Cor do texto digitado
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(color: themeColor),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: themeColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: themeColor, width: 2.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                cursorColor: Colors.white, // Cor do cursor
                style: const TextStyle(
                    color: Colors.white), // Cor do texto digitado
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: themeColor),
                  border: const OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: themeColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: themeColor, width: 2.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                obscureText: !_isPasswordVisible,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage()),
                    );
                  },
                  child: Text(
                    'Esqueci a senha',
                    style: TextStyle(color: themeColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PerguntaApp()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  elevation: 0,
                  minimumSize: const Size(200, 48),
                ),
                child:
                    Text("Login", style: GoogleFonts.josefinSans(fontSize: 20)),
              ),
              const SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        color: Color(0xFF0DAD9E),
                        height: 36,
                      ),
                    ),
                  ),
                  const Text("Novo aqui?",
                      style: TextStyle(
                        color: Color(0xFF0DAD9E),
                        fontWeight: FontWeight.w600,
                      )),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        color: Color(0xFF0DAD9E),
                        height: 36,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  elevation: 0,
                  minimumSize: const Size(200, 48),
                ),
                child: Text("Cadastre-se",
                    style: GoogleFonts.josefinSans(fontSize: 20)),
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF0E1315), // Cor de fundo do Scaffold
    );
  }
}
