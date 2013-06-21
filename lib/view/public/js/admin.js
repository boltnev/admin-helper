function unattach(procname){
    
  jQuery.ajax({
    url: "/unattach_process",
    type: "POST",
    data: { procname: procname }
  }).done(function(content) {
    jQuery("#monitored_procs").replaceWith(content);
  })

}

function kill9(pid){
  jQuery.ajax({
    url: "/kill9",
    type: "POST",
    data: { pid: pid }
  }).done(function(content) {
    jQuery("#index").replaceWith(content);
  })

}
