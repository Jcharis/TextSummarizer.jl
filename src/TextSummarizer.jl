module TextSummarizer
export text_summarizer
using WordTokenizers
stopwords = Set(["any","itself","more","either","into","whereby","neither","can","least","thereby","they","elsewhere","yours","latterly","otherwise","whether","both","toward","through","give","and","did","at","ca","were","hereafter","no","whereupon","in","made","their","therefore","seemed","whole","sixty","me","his","also","to","should","us","whom","he","the","along","enough","forty","you","before","now","mine","please","what","go","perhaps","wherein","less","besides","bottom","because","keep","see","thereupon","cannot","mostly","nevertheless","there","whence","noone","below","although","by","everything","is","never","really","someone","two","how","doing","herself","him","nowhere","amount","seems","anyone","anyway","nothing","show","until","are","another","however","various","within","herein","my","while","anyhow","hence","well","against","much","nor","several","last","only","serious","among","ourselves","would","be","under","per","former","just","will","quite","upon","around","down","might","fifteen","together","fifty","hundred","than","becoming","out","these","about","our","wherever","anything","back","onto","used","still","meanwhile","every","up","seeming","whoever","empty","becomes","due","over","though","myself","why","once","hers","whither","was","six","hereby","alone","became","ever","even","sometimes","beyond","formerly","must","something","except","everywhere","eight","move","on","all",
     "i","her","from","too","which","front","take","for","part","such","without","one","re","put","during","thence","same","amongst","always","few","does","make","that","very","via","them","above","further","am",
     "a","then","anywhere","if","first","rather","become","its","unless","call","hereupon","thru","side","this","whereafter","beforehand","yourselves","already","nobody","beside","latter","nine","with","afterwards","say","often","since","else","here","moreover","or","do","therein","namely","those","using","somehow","themselves","thereafter","thus","towards","almost","get","off","she","behind","many","of","regarding","who","sometime","other","your","where","five","it","third","been","top","whatever","three","twenty","seem","has","yet","indeed","done","each","four","ours","some","an","throughout","whenever","full","yourself","but","may","most","ten","across","own","somewhere","whose","being","between","have","none","so","could","after","we","twelve","others","name","had","when","next","whereas","as","again","himself","everyone","eleven","not"])

# include("StopWords.jl")
# stopwords = StopWords.stopwords()

"""
    
    text_summarizer(AbstractString::your_text)

usage: text_summarizer(docx)

Summarizes a document/text or corpus using a simple extractive summarization technique


"""
function text_summarizer(docx::AbstractString)
    word_frequencies = Dict()
    for word in tokenize(docx)  
            if word ∉ stopwords
                if word ∉ keys(word_frequencies)
                    word_frequencies[word] = 1
                else
                    word_frequencies[word] += 1
                end
            end
    end

    # Maximum Word Freq
    maximum_frequency = maximum(values(word_frequencies))
    for word in keys(word_frequencies)
            word_frequencies[word] = (word_frequencies[word]/maximum_frequency)
    end
        
    sentence_list = split_sentences(docx)
    sentence_scores = Dict()
    for sent in sentence_list 
        for word in tokenize(lowercase(sent))
            if word in keys(word_frequencies)
                if length(split(sent," ")) < 30
                    if sent ∉ keys(sentence_scores)
                        sentence_scores[sent] = word_frequencies[word]
                        else
                            sentence_scores[sent] += word_frequencies[word]
                        end
                    end
                end

            end
    end
    # Find Nlargest using sort or datastructures heap nlargest
    summary_sentences = sort(collect(zip(values(sentence_scores),keys(sentence_scores))),rev=true)
#     for w in summary_sentences3
#                 println(w[2])# helps to get only the text not the values scores
#         end
    summarised_list =  [ w[2] for w in summary_sentences ]
    summary = join(summarised_list,"  ")
            return summary

end

end