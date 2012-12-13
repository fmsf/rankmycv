
import 'dart:html';
import 'dart:core';
import 'Ranker.dart';

num rotatePos = 0;

void main() {
  
  query("#rateitbtn").on.click.add((e) {
    print("rateitbtn clicked");
    Ranker r = new Ranker();
    num result = ((r.CalculateScore() / r.getMaxScore()) * 100);
    result = result > 100 ? 100 : result;
    result = result.isNaN ? 0 : result;
    query("#compatibility").text = "${result.toInt().toString()}%";
    queryAll("#result .hint").forEach((Element element) {
      element.style.display = "none";
    });
    
    queryAll("#result .result").forEach((Element element) {
      element.style.display = "inline";
    });
    
    if(result>0){
      query("#matchedText").innerHtml=r.getHighlightedText();
      query("#matchedTextWrapper").style.display="block";
    } 
    
  });
    
  

}
