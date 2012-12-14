library InputText;

import 'dart:html';


class InputText {
  
  static List<String> enStopWordsList = ["the","of","to","and","a","in","for","is","The","that","on","said","with","be","was","by","as","are","at","from","it","has","an","have","will","or","its","he","not","were","which","this","but","can","more","his","been","would","about","their","also","they","million","had","than","up","who","In","one","you","new","A","I","other","year","all","two","S","But","It","company","into","U","Mr.","system","some","when","out","last","only","after","first","time","says","He","years","market","no","over","we","could","if","people","percent","such","This","most","use","because","any","data","there","them","government","may","software","so","New","now","many","used","program","systems","three","do","Inc","between","billion","what","through","per","make","before","should","these","down","under","made","Corp","companies","much","work","users","officials","like","business","support","just","each","those","her","well","since","she","information","both","being","your","products","president","share","sales","where","say","get","network","against","We","while","even","If","week","price","group","way","during","state","still","same","then","number","For","They","our","very","shares","next","including","computer","set","applications","off","available","York","how","prices","take","him","American","using","must","part","back","expected","good","stock","And","high","another","several","months","end","report","IBM","product","industry","don't","own","four","major","need","power","management","control","did","less","rate","file","called","United","As","Soviet","There","second","without","want","day","found","month","reported","see","development","help","cent","public","today","Co","money","case","interest","programs","PC","trading","based","five","cost","days","large","problems","too","service","line","user","federal","few","At","include","told","does","going","plan","C","technology","increase","until","performance","go","provide","might","results","offer","least","run","small","it's","operating","current","Windows","Bush","National","police","different","quarter","my","memory","according","plans","long","ago","around","version","disk","rose","Friday","early","problem","think","President","process","One","services","costs","oil","home","area","higher","Mr","former","Monday","however","among","spokesman","board","already","earlier","announced","standard","issue","rates","Tuesday","application","within","little","economic","When","members","office","files","recent","States","later","Wednesday","better","West","past","On","show","come","chief","whether","That","pay","change","know","unit","six","put","agreement","cents","Some","example","Department","Thursday","Pounds","hard","added","House","local","company's","law","world","right","production","You","value","order","trade","financial","possible","far","access","design","point","However","political","become","features","fell","late","It's","news","San","important","Systems","move","director","military","total","court","here","foreign","began","Washington","N","operations","future","best","average","growth","tax","lower","meeting","left","drive","issues","give","us","country","official","big","held","executive","level","general","investment","John","An","came","didn't","chairman","US","find","me","close","June","range","given","interface","These","Bank","buy","To","Japanese","real","took","place","bank","making","includes","result","firm","With","database","model","reports","half","every","points","March","never","enough","provides","yesterday","times","addition","No","life","common","changes","DOS","doesn't","further","top","decision","compared","likely","due","period","open","markets","call","capital","name","national","closed","recently","proposed","single","able","lot","sold","South","package","test","customers","British","cut","sell","International","full","running","equipment","computers","index","working","Congress","contract","paper","workers","vice","study","others","System","research","low","makes","Federal","city","May","got","family","policy","investors","record","loss","received","April","Exchange","code","graphics","agency","increased","manager","keep","look","often","designed","European","earnings","environment","July","job","third","water","net","banks","analysts","strong","party","economy","away","dollar","taken","developed","continue","allow","Microsoft","key","either","security","project","agreed","though","Japan","rather","countries","plant","along","Apple","action","After","screen","war","processing","employees","included","asked","special","field","energy","old","deal","offers","nearly","weeks","debt","She","charges","Union","needs","effect","income","uses","again","Computer","East","similar","Europe","near","create","form","main","free","largest","return","machine","hours","yet","text","almost","All","man","required","hardware","private","allows","killed","international","known","things","base","bonds","groups","list","Mac","done","means","additional","gas","areas","trying","force","isn't","funds","lost","once","can't","server","Texas","OS","City","calls","space","annual","color","Sunday","networks","believe","size","administration","states","functions","release","corporate","T","across","needed","miles","London","comment","building","comes","demand"];
  
  List<String> _input;
  Set<String> _inputSet;
  Set<String> enStopWords;
  Set<String> _hits;
  final int _DIRECT_SCORE = 1;
  String _originalText;
  
  InputText(String input){
    _originalText = input;
    //input = input.replaceAll(new RegExp("[^a-zA-Z 0-9]"), " ");
     _input = input.replaceAll(new RegExp("[^a-zA-Z 0-9]"), " ").split(" ");
     _inputSet = new Set();
     _input.forEach((String val){
       if(val.trim().length>=2){
         _inputSet.add(val.toLowerCase());
       }
     });
     
     enStopWords = new Set();
     enStopWordsList.forEach((String s) {
       enStopWords.add(s.toLowerCase());
     });

     //_inputSet.addAll(_input);
     //_inputSet.removeAll(enStopWords);
  }
  
  bool contains(String word){
    return _inputSet.contains(word);
  }
  
  int maxDirectMatchScore(){
    return _inputSet.length;
  }
  
  int getDirectMatchScore(InputText externalIt){
    int result = 0;
    _hits = new Set();
    externalIt._input.forEach((String word){
      word = word.toLowerCase();
      if(!enStopWords.contains(word) && word.length>1){
        result += _inputSet.contains(word) ?  getWordScore(word) : 0;
        if(_inputSet.contains(word)){
          print("match $word");
          _hits.add(word);
        }       
      }
    });
    return result;
  }
  
  int getFilteredInputSize(){
    int filteredSize = 0;
    Set<String> verifiedWords = new Set();
    _inputSet.forEach((String s) {
      if(s.length>0 && !enStopWords.contains(s) && !verifiedWords.contains(s)){
        filteredSize += 1;
        verifiedWords.add(s);
      }
    });
    return filteredSize;
  }
  
  int getWordScore(String word){
    return _DIRECT_SCORE;
  }
  
  String highlightText(InputText externalText){
    String text = externalText.getText().trim().toLowerCase();
    _hits.forEach((String s) {
      text = text.replaceAll(s, '<span class="highlight">${s}</span>');
    });
    return text;
  }
  
  String getText(){
    return _originalText;
  }
  
  
}
