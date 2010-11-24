module SlideshowsHelper

  def insert_slideshow(params={})
    @content_for_head_added ||= false

    params[:group]||=""
    params[:max]||=5
    params[:arrows]||=true
    params[:frame]||=true

    if not @content_for_head_added
      content_for(:head) { stylesheet_link_tag 'slideshow.css' }
      content_for(:head) { javascript_include_tag 'slides.min.jquery.js' }
      content_for(:head) do 
        %{ <script type="text/javascript">
             $(function(){
			$('#slides').slides({
				preload: true,
				preloadImage: '/images/loading.gif',
				play: 5000,
				pause: 2500,
				hoverPause: true,
			});
		});
        </script> }
      end
      @content_for_head_added = true
    end

    add_arrows = ""
    if (params[:arrows])
      add_arrows = <<-links
      <a href="#" class="prev"><img src="/images/arrow-prev.png" width="24" height="43" alt="Arrow Prev"></a>
      <a href="#" class="next"><img src="/images/arrow-next.png" width="24" height="43" alt="Arrow Next"></a>
      links
    end

    slides_div = content_tag :div, :id => "slides" do
      [content_tag(:div, slide_images(params), :class => "slides_container"), add_arrows].join("\n")
    end

    add_frame = ""
    if (params[:frame])
      add_frame = <<-frame
                  <img src="/images/frame.png" width="739" height="341" alt="Example Frame" id="frame">
                  frame
    end

    content_tag :div, :class => "slideshow" do
      [slides_div, add_frame].join("\n")
    end

  end

  def slide_images(params)
      max = params[:max]
      group = params[:group]
      slides = Slide.included.localized(I18n.locale.to_s).in_group(group)
      extra_slides = Slide.not_included.localized(I18n.locale.to_s).in_group(group).sort_by { rand }.slice(0...max-slides.count)
      slides = (slides + extra_slides).sort_by { |slide| slide.position }
      
      slides.map do |slide|
        link_to(image_tag(slide.img.url), slide.url, { :title => slide.name })
      end.join("\n")
  end

end
