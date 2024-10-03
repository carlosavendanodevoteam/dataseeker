project_name: "bq_demo_c"

visualization: {
  id: "unique-id"
  label: "Visualization Label"
  url: "https://www.w3schools.com/html/tryit.asp?filename=tryhtml_default"
  sri_hash: "SRI hash"
  dependencies: ["https://www.w3schools.com/html/tryit.asp?filename=tryhtml_default","dependency_url_2"]
}

project_name: "super_duper_extension"
application: super_duper_extension {
  label: "Super Duper Extension"
  url: "http://localhost:8080/dist/bundle.js"
  mount_points: {
    standalone: no
  }
  entitlements: {
    local_storage: no
    navigation: no
    new_window: no
    new_window_external_urls: []
    use_form_submit: yes
    use_embeds: no
    use_downloads: no
    core_api_methods: []
    external_api_urls: []
    oauth2_urls: []
    scoped_user_attributes: []
    global_user_attributes: []
  }
}
