# TextSummarizer.jl


+ Text Summarizer and Document Summarizer in Julia
+ Summarizes a document/text or corpus using a simple extractive summarization technique

#### Purpose
+ To summarize documents and text using basic summarization technique(extractive summarization)

#### Usage
```julia 
using TextSummarizer

docx = "..."
text_summarizer(docx)

```

#### Usage
```julia-repl
include("TextSummarizer.jl")

docx = "The nativity of Jesus or birth of Jesus is described in the gospels of Luke and Matthew. The two accounts differ, but agree that Jesus was born in Bethlehem in Judea during the reign of King Herod the Great, his mother Mary was married to a man named Joseph, who was descended from King David and was not his biological father, and that his birth was caused by divine intervention.

Luke's version says the birth took place during the Census of Quirinius, mentions an annunciation to the shepherds, the presentation of Jesus at the Temple, and gives the name of the angel who announces the coming birth to Mary (the archangel Gabriel). Matthew's version mentions the arrival of the Magi, the flight into Egypt by the family, and the Massacre of the Innocents by King Herod. The consensus of scholars is that both gospels were written about AD 75-85, and while it is possible that one account might be based on the other, or that the two share common source material, the majority conclusion is that the two nativity narratives are independent of each other.

The nativity is the basis for the Christian holiday of Christmas and plays a major role in the Christian liturgical year. Christian congregations of the Western tradition (including the Catholic Church, the Western Rite Orthodox, the Anglican Communion, and many other Protestants, such as the Moravian Church) begin observing the season of Advent four Sundays before Christmas, the traditional feast-day of his birth, which falls on December 25"


TextSummarizer.text_summarizer(docx)

"Matthew's version mentions the arrival of the Magi, the flight into Egypt by the family, and the Massacre of the Innocents by King Herod.  The nativity of Jesus or birth of Jesus is described in the gospels of Luke and Matthew.  The nativity is the basis for the Christian holiday of Christmas and plays a major role in the Christian liturgical year."


```



#### NB
+ It's still in the early stages, so we're very interested in bug reports, contributions and the like.



##### Author
+ Jesse E.Agbe(JCharis)
+ Jesus Saves@JCharisTech
