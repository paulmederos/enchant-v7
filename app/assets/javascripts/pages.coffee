$ ->
  # Only show certain # of posts on home; 
  # Hide the rest until needed.
  if $('.card-post').length > 0
    $posts =  $('.card-post')
    $hiddenPostsContainer = $('.hidden-posts')
    $visiblePostsContainer = $('.visible-posts')
    postsToShow = $visiblePostsContainer.data('amount-visible')
    postsToShow ||= 4

    $posts.each (index, element) ->
      if index >= postsToShow
        $(element).appendTo($hiddenPostsContainer)

  # Reveal posts when asked to
  $(document).on 'click', '.show-more-posts', (e) ->
    $hiddenPostsContainer = $('.hidden-posts')
    $visiblePostsContainer = $('.visible-posts')
    postsToReveal = 3

    $hiddenPostsContainer.find('.card-post').each (index, element) ->
      if index < postsToReveal
        $(element).appendTo($visiblePostsContainer)
        $('.show-more-posts').hide() if $hiddenPostsContainer.find('.card-post').length == 0
    e.preventDefault()

  # Smooth scrolling when needed (e.g. single page links)
  $(document).on 'click', "a.scrollable-anchor", (e) ->
    if location.pathname.replace(/^\//, "") is @pathname.replace(/^\//, "") and location.hostname is @hostname
      target = $(@hash)
      target = (if target.length then target else $("[name=" + @hash.slice(1) + "]"))
      if target.length
        $("html,body").animate
          scrollTop: target.offset().top
        , 800, "materialEase"
        false

  # Link via entire Card
  $(document).on 'click', '.js-card', (e) ->
    link = $(@).find("a").first().attr('href')
    window.location = link




# Material easing definition
$.easing.jswing = $.easing.swing
$.extend $.easing,
  def: "easeOutQuad"
  materialEase: (x, t, b, c, d) ->
    return c / 2 * t * t + b  if (t /= d / 2) < 1
    -c / 2 * ((--t) * (t - 2) - 1) + b  
