+++
author = "Mk"
date = 2022-01-20T21:00:00Z
draft = true
hero = ""
tags = ["javascript"]
title = "Case sensitive search using localCompare"
type = "blog"

+++
Изначально проблема с которой я столкнулся была: "Как отсортировать массив строчек, так что бы результат проходил чужие тесты" и выяснилось что это не так то просто

для сортировки в javscript есть два способа через операторы "<" ">" и String().localCompare

    //@ts-ignore
    const cmp = function(a:string,b: string){
        return a > b ? 1 : (a < b ? -1 :  0) 
    }
    //@ts-ignore
    const lc = function(a:string, b: string){
        return a.localeCompare(b, 'en');
    }
    //impelenting in sort
    console.log("1.   cmp", ['BAT', 'Bat', 'Bar', 'Bay'].sort(cmp))
    console.log("2. lcCmp", ['BAT', 'Bar','Bat', 'Bay'].sort(lc));
    /*
    Result:
    [LOG]: "1.   cmp",  ["BAT", "Bar", "Bat", "Bay"] 
    [LOG]: "2. lcCmp",  ["Bar", "Bat", "BAT", "Bay"] 
    */

cmp на базе "<" ">" - тупой простой и надежный, но строиться на номере в ASCII таблице. легко реализуем на любом языке и скорее всего именно его от вас ожидают, но его особенность что _СТРОЧНЫЕ_ буквы будут стоять раньше _прописных._

а вот localCompare получается фигня - на этом примере кажется что сортировка игнорирует регистр.

Но нет копая дальше, выяснилось что это пример неудачный, регистр учитывается но с точки зрения localCompre a > B , a > b и A > B и a > b если буква в алфавите идет раньше то она отсортируеться раньше внезависимости от регистра. WAT. В общем, это оказалось неожиданно.

    console.log("3. lc      ", ['a', "A", 'B', 'b'].sort(cmp))
    console.log("4. lc      ", ['a', "A", 'B', 'b'].sort(lc));
    console.log("5. lc.en.  ", ['a', "A", 'B', 'b'].sort((a,b) => a.localeCompare(b, "en",)));
    //console.log("6. lc.en", ['a', "A", 'B', 'b'].sort((a,b) => a.localeCompare(b, "en_GB")));
    //error: Incorrect locale information provided
    console.log("7. lc base ", ['a', "A", 'B', 'b'].sort((a,b) => a.localeCompare(b, "en", { sensitivity: 'base' } )));
    console.log("8. lc upper", ['a', "A", 'B', 'b'].sort((a,b) => a.localeCompare(b, "en", { caseFirst: 'upper' } )));
    console.log("9. lc - up ", ['a', "A", 'B', 'b'].sort((a,b) => a.localeCompare(b, undefined, { caseFirst: 'upper' } )));
    console.log("10.lc ru   ", ['a', "A", 'B', 'b'].sort((a,b) => a.localeCompare(b, "ru" )));
    console.log("11.lc ru up", ['a', "A", 'B', 'b'].sort((a,b) => a.localeCompare(b, "ru", { caseFirst: 'upper' } )));
    /*
    [LOG]: "1.   cmp",  ["BAT", "Bar", "Bat", "Bay"] 
    [LOG]: "2. lcCmp",  ["Bar", "Bat", "BAT", "Bay"] 
    [LOG]: "3. lc      ",  ["A", "B", "a", "b"] 
    [LOG]: "4. lc      ",  ["a", "A", "b", "B"] 
    [LOG]: "5. lc.en.  ",  ["a", "A", "b", "B"] 
    [LOG]: "7. lc base ",  ["a", "A", "B", "b"] 
    [LOG]: "8. lc upper",  ["A", "a", "B", "b"] 
    [LOG]: "9. lc - up ",  ["A", "a", "B", "b"] 
    [LOG]: "10.lc ru   ",  ["a", "A", "b", "B"] 
    [LOG]: "11.lc ru up",  ["A", "a", "B", "b"] 
    */

full code in [Typescript Playground](https://www.typescriptlang.org/play?ssl=44&ssc=1&pln=22&pc=1#code/LAKA9GAuAWCmBOsAEkDuB7JqCGBPFmAxugLYAO2iSAzpPAJYB2A5kgDxIB8Sx5lsAGiTZGAEyQAbdIWwSAwqTIJYoUBAACkagFp6zRukShijWj3JIAvEgBmAV0aFI9dIwAU2AQCMAlAG9QJCCkREg7eEZhLiQvJAB+JABGJAAuJA92GPikbWS0pAAGH1AAXzUwTR09AyMQEzMJQitbBycXd08Y-0Dg0PDI7AA6KRkJWAU+RDcvIQByWEZZnwBuUvL6clgxxmcWJCYaQ0hjV2p0MeH0ZjcAIkTB4MJyG6EAbVmAIQBBABVZuY+2Eg-yQn0oILBuFmAF1Bmd4JA3E8yD5inVTudYJdrjcAEwPRpyZ5vT6-CGA+D-MHAgF4GFwo5uRqo1bgABUoFeABkAPIAcWhaTuDyCyJeQVeN2+P3FUsossBkAVeBu0KQnN5AqF+MkhCJZHFSElFOVSqEUt+ytwqvVIDZYHKMGQZHg6C8YxI+2oaQA6tB8NL9qZ6KJkOgbEgKcIxJG8Eg7NQmKwRrIJhQqCJxNB0KgkCRsABrZD0SC2ejwWjlUR6Zj0JNIatkJTwfal6iwbAkagoaBAnjYds0BaJ5wAN2Q7cohGgWEMBZidkgaXQZGcpyDkmkqcU-AbrlmpYw8ALqnRpkx2NuAGYCU1gkFxe9sCCbl9xZ8IV56fDEcjUSdzwuKQcQAFlve8HxJZ9zTfAFP2-RlmRWACziAq5bgAVlvQYFhFR9ZmgpBX3fD54NhH83A8bwfCsbghhTMY034aZzQWF5UWQ8AwHqC9gNuAA2bC2Kgl9YNBUi5i-cjGSo3xaOES5RnGHcphmIiFgAfT5D4bg41kIAQV14DSABJRxDEQJxNyUoMbEMfM10iF10FHENYFEFDePQm4AHZwK8AdkHwwjiLgySEIRSjPDkyw6MU2RlMmWAWPUxhxT8IdgzHEtcDSWYAvbWYkBKJA9M8tCcQADnAuwmwQYLRJIsiGUi2SaNihSGMS9NkrUm5hKQDKZHbAAxctaDy2rmyKkqyrPVCsT4m4AE5wO0eMyCIkSYKa8LpNa6L2rirqmNUoQHFDGwmHcoQhsCsaKyXUEpoQGbSpZcrFu8xICmGJp4DsYIGp2sLQSklrETa+T6K3RiVN680AZud7OJ4irbkSe5GhCQHauBoixI-PaIai6jofiuGkpSm4kdu-tRvGp7ZheylipR-SORAbl+UFIj7keYkJQtGVzRNUWgStG0NR57Vb31Q1jXlcWzSI6VJbVaWtSIm9dQgrahbEqVZWwWUvClrnNV5m4wN1iCFZuE2QaIs3RfN7mtZuLDdRwxg8KEI0HdlQ2XdVt3LaFPzdYKoL-clR2CYVU2w5lojqt1ln7cN+OjfNM2NYtlOVrWjb9YDrPE9z5OPZ+v6caB2PA6dm4Q6N-P3atzHa4BjbM+NivnfN+1T2HkBQCAA)

node 14 tested, chrome tested,

так что кажется \['a', 'A', 'B', 'b'\].sort((a,b) => a.localeCompare(b, 'en', { caseFirst: 'upper' } )); это самый короткий

[Documentation ru](https://developer.mozilla.org/ru/docs/Web/JavaScript/Reference/Global_Objects/String/localeCompare)

[Documentation en (shorter then ru)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/localeCompare)