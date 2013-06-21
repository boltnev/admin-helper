function unattach(procname){
  
jQuery.ajax({
  url: "/unattach_process",
  type: "POST",
  data: { procname: procname }
}).done(function(content) {
  jQuery("#monitored_procs").replaceWith(content);
})

}
