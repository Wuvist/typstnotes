// Some definitions presupposed by pandoc's typst output.
#let blockquote(body) = [
  #set text( size: 0.92em )
  #block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[#body]
]

#let horizontalrule = [
  #line(start: (25%,0%), end: (75%,0%))
]

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

// Some quarto-specific definitions.

#show raw: it => {
  if it.block {
    if it.lang == "julia" or it.lang =="python" {
      let top_right(lang) = style(styles => {
        let body = "Python"
        if lang == "julia" {
          body = "Julia"
        }
        let w = measure(body, styles).width
        place(
          dy:-8pt,
          dx: 100%- w,
          block(fill: luma(255), inset: 4pt, body),
        )
      })
      block(fill: luma(250), width: 100%, inset: 8pt, radius: 2pt, [
        #top_right(it.lang)
        #it
      ], )
    } else {
      block(fill: luma(230), width: 100%, inset: 7pt, radius: 1pt, it)
    }
  } else {
    it
  }
}
$body$
