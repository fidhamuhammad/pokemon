import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class TabItems{
  TabItems({
    this.stateMachine = '',
    this.artboard = '',
    this.status,
  });

  UniqueKey? id = UniqueKey();
  String stateMachine;
  String artboard;
  late SMIBool? status;

  static List<TabItems> tabItemsList = [
    TabItems(stateMachine: 'USER_Interactivity', artboard: 'USER'), 
    TabItems(stateMachine: 'AUDIO_Interactivity', artboard: 'AUDIO'),
    TabItems(stateMachine: 'SETTINGS_Interactivity', artboard: 'SETTINGS'), 
    TabItems(stateMachine: 'BELL_Interactivity', artboard: 'BELL'), 

    // TabItems(stateMachine: 'TIMER_Interactivity', artboard: 'TIMER'), 
    // TabItems(stateMachine: 'CHAT_Interactivity', artboard: 'CHAT'),

  ];
}