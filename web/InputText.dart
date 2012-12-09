library InputText;

import 'dart:html';


class InputText {
  
  static List<String> enStopWords = ["the","name","of","very","to","through","and","just","a","form","in","sentence","is","great","it","think","you","say","that","help","he","low","was","line","for","differ","on","turn","are","cause","with","much","as","mean","I","before","his","move","they","right","be","boy","at","old","one","too","have","same","this","tell","from","does","or","set","had","three","by","want","hot","air","word","well","but","also","what","play","some","small","we","end","can","put","out","home","other","read","were","hand","all","port","there","large","when","spell","up","add","use","even","your","land","how","here","said","must","an","big","each","high","she","such","which","follow","do","act","their","why","time","ask","if","men","will","change","way","went","about","light","many","kind","then","off","them","need","write","house","would","picture","like","try","so","us","these","again","her","animal","long","point","make","mother","thing","world","see","near","him","build","two","self","has","earth","look","father","more","head","day","stand","could","own","go","page","come","should","did","country","number","found","sound","answer","no","school","most","grow","people","study","my","still","over","learn","know","plant","water","cover","than","food","call","sun","first","four","who","between","may","state","down","keep","side","eye","been","never","now","last","find","let","any","thought","new","city","work","tree","part","cross","take","farm","get","hard","place","start","made","might","live","story","where","saw","after","far","back","sea","little","draw","only","left","round","late","man","run","year","don't","came","while","show","press","every","close","good","night","me","real","give","life","our","few","under","north"];
  
  List<String> _input;
  Set<String> _inputSet;
  
  final int _DIRECT_SCORE = 1;
  
  InputText(String input){
    input = input.replaceAll(new RegExp("[^a-zA-Z 0-9]"), " ");
     _input = input.replaceAll(new RegExp("[^a-zA-Z 0-9]"), " ").split(" ");
     _inputSet = new Set();
     _input.forEach((String val){
       if(val.trim().length>=2){
         _inputSet.add(val);
       }
     });
     //_inputSet.addAll(_input);
     _inputSet.removeAll(enStopWords);
  }
  
  bool contains(String word){
    return _inputSet.contains(word);
  }
  
  int maxDirectMatchScore(){
    return _inputSet.length;
  }
  
  int getDirectMatchScore(InputText externalIt){
    int result = 0;
    externalIt._input.forEach((String word){
      
      result += _inputSet.contains(word) ?  getWordScore(word) : 0;
      if(_inputSet.contains(word)){
        print("match $word");
      }
    });
    return result;
  }
  
  int getFilteredInputSize(){
    return _inputSet.length;
  }
  
  
  int getWordScore(String word){
    return _DIRECT_SCORE;
  }
}
