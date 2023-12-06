//es6 좀더 언어적으로 바뀜,Set,Map가능(컬렉션)
let set=new Set("abcccdddeeeffffff"); //중복문자 걸러냄
console.log(set);

set.add("g"); //없으니까 추가됨
console.log(set);

console.log(set.has("a")); //포함하면 true
console.log(set.has("z"));
console.log("길이: "+set.size);

console.log(...set);
set.delete("a"); //하나씩 삭제
console.log(...set);

set.clear(); //전체삭제
console.log(set.size);


//비교연산자
let a=6;
let b="6";

console.log(a==b); //true 값으로만 비교
console.log(a===b); //false 타입까지 같아야 true