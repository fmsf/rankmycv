library Ranker;

import 'dart:html';
import 'InputText.dart';



class Ranker {
  InputText _cv;
  InputText _job;
  Ranker(){
    _cv = new InputText(query("#cv").value);
    _job = new InputText(query("#job").value);
  }
  
  int CalculateScore(){
    int totalScore = 0;
    totalScore = totalScore + this._job.getDirectMatchScore(_cv);
    return totalScore;
  }
  
  String getHighlightedText(){
    return _job.highlightText(_cv);
  }
  
  int getMaxScore(){
    return _job.getFilteredInputSize();
  }
}
