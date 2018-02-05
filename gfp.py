#!/usr/bin/python
# -*- coding: utf-8 -*-

#Importação das bibliotecas
import pygtk
pygtk.require('2.0')
import gtk
from gtk import glade

#Usando arquivos do projeto
import usuarioslista
import funcoes as f
import usuarioscadastro

class Programa(gtk.Window):
#Método construtor 
  def __init__(self):
   #Variável de controle do login 
    self.matarprograma = 0;
   
   #Inicializa 
    super(Programa, self).__init__()
   
   #Carrega arquivo glade 
    self.GLADE_FILE = f.CaminhoGlade + 'gfp.glade'
    gui = glade.XML(self.GLADE_FILE, 'winGFP')
   
   #Associa os controles 
    self.mnUsuarios = gui.get_widget('mnUsuarios')
    self.mnSair = gui.get_widget('mnSair')
    self.mnSobre = gui.get_widget('mnSobre')
    self.win = gui.get_widget('winGFP')
    self.stbStatus = gui.get_widget('stbStatus')

   #Associa eventos dos controles 
    self.mnUsuarios.connect('activate', usuarioslista.UsuariosLista)
    self.mnSair.connect('activate', self.Sair, None)
    self.mnSobre.connect('activate', self.MostraSobre)
    self.win.connect('delete_event', self.Sair)
    self.win.connect('show', self.MostraLogin)

   #Início do programa 
    self.win.show_all()

   #Verifica login 
    if self.matarprograma == 0:
     #Coloca dados do usuário na barra de status 
      self.stbStatus.push(0, ' Usuário: ' + str(f.usuariologadoid) + ' - [' + f.usuariologadouser + '] ' + f.usuariologadonome)
    else:
     #Abre o programa mas deixa tudo inativo 
      self.mnUsuarios.set_sensitive(False)
      f.Mensagem(self.win, "Voc? não está logado.")
      self.stbStatus.push(0, ' Você não está logado.')


#Fechar conexões e sair 
  def Sair(self, widget, event):
    if self.matarprograma == 0:
      if f.MsgConfirmacao(self.win, 'Deseja realmente sair do GFP?'):
        f.cnx.close()
        gtk.main_quit()
        return False
      else:
        return True
    else:
      f.cnx.close()
      gtk.main_quit()
      return False     


#Abre janela sobre o programa 
  def MostraSobre(self, widget):
    guiSobre = glade.XML(self.GLADE_FILE, 'winSobre')
    winSobre = guiSobre.get_widget('winSobre')
    winSobre.run()
    winSobre.destroy()


#Abre tela de login 
  def MostraLogin(self, widget):
    T = 0
    while T == 0:
     #Carrega tela do arquivo glade 
      guiLogin = glade.XML(self.GLADE_FILE, 'winLogin')

     #Associa os controles 
      winLogin = guiLogin.get_widget('winLogin')
      edtUsuario = guiLogin.get_widget('edtUsuario')
      edtSenha = guiLogin.get_widget('edtSenha')
      btnNewUser = guiLogin.get_widget('btnNovoUser')
      lblTitulo = guiLogin.get_widget('lblEntrar')

     #Formata controles 
      lblTitulo.set_markup("Entrar no GFP")
      lblTitulo.set_justify(gtk.JUSTIFY_LEFT)

      def AbreCadastroUsu(widget):
        try:
          usuarioscadastro.UsuariosCadastro(widget, True, 0, winLogin, self)
          winLogin.set_focus(edtUsuario)
        except:
          pass

     #Associa eventos 
      edtUsuario.connect("changed", lambda *a: f.StrToMais(edtUsuario))
      edtSenha.connect("changed", lambda *a: edtSenha.set_text(f.TiraAspa(edtSenha.get_text())))
      edtUsuario.connect("focus_out_event", lambda *a: f.StrToTrim(edtUsuario))
      btnNewUser.connect("clicked", AbreCadastroUsu)

     #Abre a janela 
      self.matarprograma = winLogin.run()
     
     #Inverte valores 
      if self.matarprograma == 0:
        self.matarprograma = -1
      else:
        self.matarprograma = 0

     #Fecha janela sem verificação 
      if self.matarprograma == -1:
        T = 1

     #Verifica dados digitados 
      if (edtUsuario.get_text() != '' and edtSenha.get_text() != '') or self.matarprograma == -1:
        if self.matarprograma != -1:
#Verifica usuário no banco 
          f.query.execute("SELECT id, user, nome FROM usuarios WHERE\
                          user = '" + edtUsuario.get_text() + "' and\
                          senha = '" + edtSenha.get_text() + "'")
          T = 0

          for row in f.query:
   #Usuário encontrado 
            f.usuariologadoid = row[0]
            f.usuariologadouser = row[1]
            f.usuariologadonome = row[2]
            T = 1

          if T == 0:
            f.Mensagem(winLogin, 'Usuário ou senha inválidos!')
        else:
          T = 1
      else:
        f.Mensagem(winLogin, 'Você deve informar o usuário e a senha!')
      winLogin.destroy()


Programa()
gtk.main()