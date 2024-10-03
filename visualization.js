looker.plugins.visualizations.add({
    id: "custom_visualization", // Identificador único
    label: "Custom Visualization", // Nombre visible en el menú
    options: {
      text_color: {
        type: "string",
        label: "Text Color",
        default: "#000000"
      },
      url_to_embed: {
        type: "string",
        label: "URL to embed",
        default: "https://looker-viewer-dot-analysis-seeker.appspot.com/login?next=%2F"
      }
    },
    // Esta función se ejecuta al crear la visualización
    create: function(element, config) {
      element.innerHTML = `
        <div id="custom-vis-container" style="width:100%; height:100%; overflow:auto;">
          <iframe id="embed-frame" src="${config.url_to_embed}" style="width:100%; height:100%; border:none;"></iframe>
        </div>`;
    },
  
    // Esta función se ejecuta cada vez que los datos o las opciones cambian
    update: function(data, element, config, queryResponse) {
      document.getElementById('embed-frame').src = config.url_to_embed;
      document.getElementById('embed-frame').style.color = config.text_color;
    }
  });
