#!/usr/bin/env python
# -*- coding: utf-8 -*-

import gtk
import pygtk

pygtk.require('2.0') #garantir que estamos usando a versão 2.0 do pygtk

class OlaRaimundo:

  def __init__(self):
    # criando janela
    self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
    #ajustando a borda
    self.window.set_border_width(10)

    #associando o método fechaJanela ao evento de 'destruir' a janela
    self.window.connect('destroy',self.fechaJanela)

    #criando um botão
    self.btnOla = gtk.Button("Olá...")
    #associando evento de click ao método btnOlaClicked
    self.btnOla.connect('clicked',self.btnOlaClicked)

    #adicionando botão à janela
    self.window.add(self.btnOla)
    #mostrando a janela com todos os seus elementos
    self.window.show_all()