module JobsHelper

  def render_job_status(job)
    if job.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
    else
      content_tag(:span, "", :class => "fa fa-globe")
    end
  end

  def render_highlight_content(job,query_string)
      excerpt_cont = excerpt(job.title, query_string, radius: 500)
      highlight(excerpt_cont, query_string)
  end

  def render_member_status(job)
    if current_user && current_user.is_member_of?(job)
          link_to("", outbox_job_path(job), method: :post, class: "fa fa-folder")
    else
          link_to("", inbox_job_path(job), method: :post, class: "fa fa-folder-o")
    end
  end


  def render_voter_status(job)
     if current_user && current_user.is_voter_of?(job)
       link_to("", downvote_job_path(job), method: :post, class: "fa fa-heart", style: "color:red;")
         else
       link_to("", upvote_job_path(job), method: :post, class: "fa fa-heart-o")
     end
  end

end
