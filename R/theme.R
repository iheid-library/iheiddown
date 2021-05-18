#' A ggplot2 theme for IHEID style plots. Adapted from Hrbrmstr's ipsum theme.
#' 
#' @importFrom ggplot2 theme margin element_text element_blank element_line element_rect
#' @param base_family,base_size base font family and size
#' @param plot_title_family,plot_title_face,plot_title_size,plot_title_margin plot title family, face, size and margi
#' @param subtitle_family,subtitle_face,subtitle_size plot subtitle family, face and size
#' @param subtitle_margin plot subtitle margin bottom (single numeric value)
#' @param strip_text_family,strip_text_face,strip_text_size facet label font family, face and size
#' @param caption_family,caption_face,caption_size,caption_margin plot caption family, face, size and margin
#' @param axis_title_family,axis_title_face,axis_title_size axis title font family, face and size
#' @param axis_title_just axis title font justification, one of `[blmcrt]`
#' @param plot_margin plot margin (specify with `ggplot2::margin()`)
#' @param grid_col,axis_col grid & axis colors; both default to `#cccccc`
#' @param grid panel grid (`TRUE`, `FALSE`, or a combination of `X`, `x`, `Y`, `y`)
#' @param axis_text_size font size of axis text
#' @param axis add x or y axes? `TRUE`, `FALSE`, "`xy`"
#' @param ticks ticks if `TRUE` add ticks
#' @export
#' @examples
#' library(ggplot2)
#' library(dplyr)
#'
#' # seminal scatterplot
#' ggplot(mtcars, aes(mpg, wt)) +
#'   geom_point() +
#'   labs(x="Fuel efficiency (mpg)", y="Weight (tons)",
#'        title="Seminal ggplot2 scatterplot example",
#'        subtitle="A plot that is only useful for demonstration purposes",
#'        caption="Brought to you by the letter 'g'") +
#'   theme_iheid()
#'
#' # seminal bar chart
#'
#' count(mpg, class) %>%
#'   ggplot(aes(class, n)) +
#'   geom_col() +
#'   geom_text(aes(label=n), nudge_y=3) +
#'   labs(x="Fuel efficiency (mpg)", y="Weight (tons)",
#'        title="Seminal ggplot2 bar chart example",
#'        subtitle="A plot that is only useful for demonstration purposes",
#'        caption="Brought to you by the letter 'g'") +
#'   theme_iheid(grid="Y") +
#'   theme(axis.text.y=element_blank())
#' @export
theme_iheid <- function(base_family="sans", base_size = 11.5,
                        plot_title_family=base_family, plot_title_size = 18,
                        plot_title_face="bold", plot_title_margin = 10,
                        subtitle_family=base_family, subtitle_size = 12,
                        subtitle_face = "plain", subtitle_margin = 15,
                        strip_text_family = base_family, strip_text_size = 12,
                        strip_text_face = "plain",
                        caption_family = base_family, caption_size = 9,
                        caption_face = "italic", caption_margin = 10,
                        axis_text_size = base_size,
                        axis_title_family = subtitle_family, axis_title_size = 9,
                        axis_title_face = "plain", axis_title_just = "rt",
                        plot_margin = margin(30, 30, 30, 30),
                        grid_col = iheid_palette("IHEID")["IHEIDBlack"],
                        grid = TRUE,
                        axis_col = iheid_palette("IHEID")["IHEIDBlack"],
                        axis = FALSE, ticks = FALSE) {
  
  # ret is set as the base theme of ggplot
    
    ret <- ggplot2::theme_minimal(base_family=base_family, base_size=base_size)
    
    ret <- ret + theme(legend.background=element_blank())
    ret <- ret + theme(legend.key=element_blank())
    # Set grid
    if (inherits(grid, "character") | grid == TRUE) {
      
      ret <- ret + theme(panel.grid=element_line(color=grid_col, size=0.2))
      ret <- ret + theme(panel.grid.major=element_line(color=grid_col, size=0.2))
      ret <- ret + theme(panel.grid.minor=element_line(color=grid_col, size=0.15))
      
      if (inherits(grid, "character")) {
        if (regexpr("X", grid)[1] < 0) ret <- ret + theme(panel.grid.major.x=element_blank())
        if (regexpr("Y", grid)[1] < 0) ret <- ret + theme(panel.grid.major.y=element_blank())
        if (regexpr("x", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.x=element_blank())
        if (regexpr("y", grid)[1] < 0) ret <- ret + theme(panel.grid.minor.y=element_blank())
      }
      
    } else {
      ret <- ret + theme(panel.grid=element_blank())
    }
    # Set axis
    if (inherits(axis, "character") | axis == TRUE) {
      ret <- ret + theme(axis.line=element_line(color=iheid_palette("IHEID")["IHEIDBlack"], size=0.15))
      if (inherits(axis, "character")) {
        axis <- tolower(axis)
        if (regexpr("x", axis)[1] < 0) {
          ret <- ret + theme(axis.line.x=element_blank())
        } else {
          ret <- ret + theme(axis.line.x=element_line(color=axis_col, size=0.15))
        }
        if (regexpr("y", axis)[1] < 0) {
          ret <- ret + theme(axis.line.y=element_blank())
        } else {
          ret <- ret + theme(axis.line.y=element_line(color=axis_col, size=0.15))
        }
      } else {
        ret <- ret + theme(axis.line.x=element_line(color=axis_col, size=0.15))
        ret <- ret + theme(axis.line.y=element_line(color=axis_col, size=0.15))
      }
    } else {
      ret <- ret + theme(axis.line=element_blank())
    }
    # Set Ticks
    if (!ticks) {
      ret <- ret + theme(axis.ticks = element_blank())
      ret <- ret + theme(axis.ticks.x = element_blank())
      ret <- ret + theme(axis.ticks.y = element_blank())
    } else {
      ret <- ret + theme(axis.ticks = element_line(size=0.15))
      ret <- ret + theme(axis.ticks.x = element_line(size=0.15))
      ret <- ret + theme(axis.ticks.y = element_line(size=0.15))
      ret <- ret + theme(axis.ticks.length = grid::unit(5, "pt"))
    }
    # Set the position of axis title 
    xj <- switch(tolower(substr(axis_title_just, 1, 1)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
    yj <- switch(tolower(substr(axis_title_just, 2, 2)), b=0, l=0, m=0.5, c=0.5, r=1, t=1)
    # Other axis elements
    ret <- ret + theme(axis.text.x=element_text(size=axis_text_size,
                                                margin=margin(t=0),
                                                colour = "#5c666f",
                                                family = "sans"))
    ret <- ret + theme(axis.text.y=element_text(size=axis_text_size,
                                                margin=margin(r=0),
                                                colour = "#5c666f",
                                                family = "sans"))
    ret <- ret + theme(axis.title=element_text(size=axis_title_size, family=axis_title_family))
    ret <- ret + theme(axis.title.x=element_text(hjust=xj, size=axis_title_size,
                                                 family=axis_title_family, face=axis_title_face))
    ret <- ret + theme(axis.title.y=element_text(hjust=yj, size=axis_title_size,
                                                 family=axis_title_family, face=axis_title_face))
    ret <- ret + theme(axis.title.y.right=element_text(hjust=yj, size=axis_title_size, angle=90,
                                                       family=axis_title_family, face=axis_title_face))
    # Facet elements
    ret <- ret + theme(strip.text=element_text(hjust=0, size=strip_text_size,
                                               face=strip_text_face, family=strip_text_family))
    # Spacing between panels
    ret <- ret + theme(panel.spacing=grid::unit(2, "lines"))
    # Plot Title
    ret <- ret + theme(plot.title=element_text(hjust=0, size=plot_title_size,
                                               margin=margin(b=plot_title_margin),
                                               family=plot_title_family, face=plot_title_face,
                                               color=iheid_palette("IHEID")["IHEIDRed"]))
    ret <- ret + theme(plot.subtitle=element_text(hjust=0, size=subtitle_size,
                                                  margin=margin(b=subtitle_margin),
                                                  family=subtitle_family, face=subtitle_face,
                                                  color = iheid_palette("IHEID")["IHEIDBlack"]))
    ret <- ret + theme(plot.caption=element_text(hjust=1, size=caption_size,
                                                 margin=margin(t=caption_margin),
                                                 family=caption_family, face=caption_face,
                                                 color = iheid_palette("IHEID")["IHEIDGrey"]))
    ret <- ret + theme(plot.margin=plot_margin)
    
    ret
    
  }
  

# Old version for reference
  # ggplot2::theme(
  #   
  #   #Text format:
  #   #This sets the font, size, type and colour of text for the chart's title
  #   plot.title = ggplot2::element_text(family=font,
  #                                      size=28,
  #                                      face="bold",
  #                                      color=iheid_palette("IHEID")["IHEIDRed"]),
  #   #This sets the font, size, type and colour of text for the chart's subtitle, as well as setting a margin between the title and the subtitle
  #   plot.subtitle = ggplot2::element_text(family=font,
  #                                         size=22,
  #                                         margin=ggplot2::margin(9,0,9,0)),
  #   plot.caption = ggplot2::element_blank(),
  #   #This leaves the caption text element empty, because it is set elsewhere in the finalise plot function
  #   
  #   #Legend format
  #   #This sets the position and alignment of the legend, removes a title and background for it and sets the requirements for any text within the legend. The legend may often need some more manual tweaking when it comes to its exact position based on the plot coordinates.
  #   legend.position = "top",
  #   legend.text.align = 0,
  #   legend.background = ggplot2::element_blank(),
  #   legend.title = ggplot2::element_blank(),
  #   legend.key = ggplot2::element_blank(),
  #   legend.text = ggplot2::element_text(family=font,
  #                                       size=18,
  #                                       color=iheid_palette("IHEID")["IHEIDBlack"]),
  #   
  #   #Axis format
  #   #This sets the text font, size and colour for the axis test, as well as setting the margins and removes lines and ticks. In some cases, axis lines and axis ticks are things we would want to have in the chart - the cookbook shows examples of how to do so.
  #   axis.title = ggplot2::element_blank(),
  #   axis.text = ggplot2::element_text(family=font,
  #                                     size=14,
  #                                     color=iheid_palette("IHEID")["IHEIDBlack"]),
  #   axis.text.x = ggplot2::element_text(margin=ggplot2::margin(5, b = 10)),
  #   axis.ticks = ggplot2::element_blank(),
  #   axis.line = ggplot2::element_blank(),
  #   
  #   #Grid lines
  #   #This removes all minor gridlines and adds major y gridlines. In many cases you will want to change this to remove y gridlines and add x gridlines. The cookbook shows you examples for doing so
  #   panel.grid.minor = ggplot2::element_blank(),
  #   panel.grid.major.y = ggplot2::element_line(color=iheid_palette("IHEID")["IHEIDGrey"]),
  #   panel.grid.major.x = ggplot2::element_blank(),
  #   
  #   #Blank background
  #   #This sets the panel background as blank, removing the standard grey ggplot background colour from the plot
  #   panel.background = ggplot2::element_blank(),
  #   
  #   #Strip background (#This sets the panel background for facet-wrapped plots to white, removing the standard grey ggplot background colour and sets the title size of the facet-wrap title to font size 22)
  #   strip.background = ggplot2::element_rect(fill="white"),
  #   strip.text = ggplot2::element_text(size  = 22,  hjust = 0)
  # )

# library(ggplot2); library(iheiddown)
