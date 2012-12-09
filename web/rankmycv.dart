
import 'dart:html';
import 'dart:core';
import 'Ranker.dart';

num rotatePos = 0;

void main() {
  
  query("#rateitbtn").on.click.add((e) {
    print("rateitbtn clicked");
    Ranker r = new Ranker();
    print(r.CalculateScore());
    print(r.getMaxScore());
    num result = ((r.CalculateScore() / r.getMaxScore()) * 100);
    print(result.toInt());
    query("#compatibility").text = "${result.toInt().toString()}%";
    queryAll("#result .hint").forEach((Element element) {
      element.style.display = "none";
    });
    
    queryAll("#result .result").forEach((Element element) {
      element.style.display = "inline";
    });
    
  });
    
  

}
