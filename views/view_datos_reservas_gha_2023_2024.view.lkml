# The name of this view in Looker is "View Datos Reservas Gha 2023 2024"
view: view_datos_reservas_gha_2023_2024 {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.Google_ads_dataset.VIEW_DATOS_RESERVAS_GHA_2023_2024` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Clicks" in Explore.

  dimension: clicks {
    type: number
    sql: ${TABLE}.Clicks ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
  }
  measure: average_clicks {
    type: average
    sql: ${clicks} ;;
  }

  dimension: coste {
    type: number
    sql: ${TABLE}.Coste ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.CTR ;;
  }

  dimension: generated {
    type: number
    sql: ${TABLE}.Generated ;;
  }

  measure: sum_generated {
    type: number
    sql: ${TABLE}.Generated ;;
  }


  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: mont_name {
    type: string
    sql: ${TABLE}.MONT_NAME ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.MONTH ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partitionTimestamp ;;
  }

  dimension: porcentaje_diff_precio {
    type: number
    sql: ${TABLE}.porcentaje_diff_precio ;;
  }


  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: year_TEXT {
    type: string
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [mont_name]
  }

  measure: avg_cpc {
    type: number
    sql:  if( ${coste} > 0 and ${clicks} > 0, ${coste}/${clicks}, 0)  ;;
  }

  dimension: cost_percent {
    type: number
    sql: ${TABLE}.cost_percent ;;
  }

  measure: average_of_cost_percent {
    type: number
    sql: ${TABLE}.cost_percent ;;
  }

  measure: real_cost_2024 {
    type: number
    sql: CASE
          WHEN ${average_of_cost_percent} IS NOT NULL THEN ${sum_generated} * (${average_of_cost_percent}/100)
          ELSE  ${TABLE}.Coste
         END ;;
  }

  measure: roas {
    type: sum
    sql: ${TABLE}.ROAS ;;
  }

  dimension: booking {
    type: number
    sql: ${TABLE}.booking ;;
  }

  measure: real_roas {
    type: number
    sql: case
          when sum(${TABLE}.roas) > 0 then ${sum_generated}/${real_cost_2024}
          else sum(${TABLE}.roas)
        end;;
  }

  dimension_group: comparation_partitionTimestamp{
    type: time
    sql: TIMESTAMP_ADD(${TABLE}.partitionTimestamp, INTERVAL 365 DAY);;
    timeframes: [raw, time, date, week, month, month_name, quarter, year]
  }


  dimension: scoring {
    type: string
    sql: CASE
        WHEN ${TABLE}.hotel_code IN ("checkin-atlantida","solvasa-valencia","checkin-yuste","checkin-rambam","checkin-nopal","checkin-sirius","estival-centurion",
        "estival-eldorado","estival-torrequebrada","estival-vilamari","isla-cristina","ocean-islantilla","estival-club","estival-pineda","impressive-premium",
        "impressive-puntacana","impressive-granada","impressive-zocos","landmar-gigantes","landmar-arena","ona-claveles","ona-valle-romano","ona-mosaic",
        "ona-acaunada","ona-cala-pi","ona-dorada-tarter","ona-garden-lago","ona-brisas","ona-casitas","ona-living-barcelona","ona-marques","marinas-de-nerja",
        "ona-alanda-clubona-palamos","ona-rosas","bahiablanca","ona-casa-lit","ona-benidorm","ona-hacienda-alamo-hotel","port-alicante","port-azafata","port-benidorm",
        "port-denia","port-elche","port-europa","port-feria","port-huerto","port-jardin","port-vista","best-serenade","serenade-all-suites","ona-village-cala-dor",
        "stein-chateau-eza","port-fiesta","fuerte-rompido","fuerte-marbella","amare-marbella","fuerte-conil-costaluz","fuerte-grazalema","olee-calaceite","amare-ibiza",
        "oasishoteles-grandcancun","oasishoteles-grandpalm","oasishoteles-tulum","oasishoteles-pyramid","oasishoteles-senscancun","oasishoteles-smart",
        "oasishoteles-ohurban","parkroyal-buenosaires","parkroyal-orlando","parkroyal-cozumel","parkroyal-vallarta","parkroyal-beachcancun","parkroyal-acapulco",
        "parkroyal-ixtapa","parkroyal-huatulco","parkroyal-mazatlan","parkroyal-miami","parkroyal-puertorico","parkroyal-loscabos","parkroyal-villascancun",
        "parkroyal-tules","ap-adriana","ap-cabanaspark","ap-dona-aninhas","ap-eva","ap-marianova","ap-oriental","ap-sinerama","ap-victoria","bahiablanca",
        "best-4barcelona","best-alcazar","best-andorracenter","best-aranea","best-autohogar","best-ballena","best-benalmadena","best-cambrils","best-capsalou",
        "best-davinciroyal","best-delta","best-frontmaritim","best-indalo","best-jacaranda","best-lloret-splash","best-losangeles","best-maritim","best-mediterraneo",
        "best-mojacar","best-negresco","best-oasispark","best-oasistropical","best-osuna","best-puebloindalo","best-punta-dorada","best-roquetas","best-sabinal",
        "best-sandiego","best-sanfrancisco","best-semiramis","best-siroco","best-soldor","best-tenerife","best-terramarina","best-triton","casa-dorada",
        "checkin-antequera","checkin-atlantida","checkin-bakour-lanzarotesplash","checkin-blanes","checkin-camino-granada","checkin-caribe","checkin-catalonia",
        "checkin-ciscar","checkin-concordia","checkin-flamingo","checkin-garbi","checkin-madrid-mostoles","checkin-magdalena","checkin-millenni","checkin-millor",
        "checkin-montserrat","checkin-nopal","checkin-palmeres","checkin-rambam","checkin-sirius","checkin-torredembarra","checkin-yuste","dreamland-heights",
        "dreamland-hills","dreamland-mirage","dreamland-palmbeach","elaya-hotel-leipzig-city-center","estival-caribou","estival-caribou-apartaments",
        "estival-centurion","estival-club","estival-cristina","estival-eldorado","estival-park-2","estival-park-3","estival-park-aptos","estival-sporting",
        "estival-torrequebrada","estival-vilamari","golf-resort-greengarden","golf-resort-oasis","golf-resort-river","golf-resort-royalgarden","hostal-marissal",
        "hotel-nerja-club","hotel-parasol-garden","isla-cristina","marinas-de-nerja","nau-dunas","nau-governador","nau-montargil","nau-morgado","nau-rafael-atlantico",
        "nau-rafael-suites","nau-salgados-palace","neptuno-roquetas","ocean-islantilla","ohtels-almeria","ohtels-belvedere","ohtels-cabogata","ohtels-carabela",
        "ohtels-fenix","ohtels-gibraltar","ohtels-islantilla","ohtels-mazagon","ohtels-oliveres","ohtels-sansalvador","ohtels-villadorada","ohtels-villaromana",
        "ona-acaunada","ona-alanda-club","ona-alborada","ona-aldea-mar","ona-benidorm","ona-brisas","ona-cala-pi","ona-campanario","ona-casa-lit","ona-claveles",
        "ona-club-bena-vista","ona-diana-park","ona-dorada-tarter","ona-garden-lagoona-hacienda-alamo","ona-hacienda-alamo-hotel","ona-jardines-paraisol",
        "ona-living-barcelona","ona-lomas-manga-club","ona-mar-menor","ona-mar-menor-aptos","ona-marbella","ona-marques","ona-mosaic","ona-ogisaka","ona-palamos",
        "ona-rosas","ona-sueno-azul","ona-suites-salou","ona-valle-romano","playamaro","port-alicante","port-azafata","port-benidorm","port-denia","port-elche",
        "port-europa","port-feria","port-fiesta","port-huerto","port-jardin","port-vista","serenade-all-suites","solvasa-laurisilva","solvasa-valencia",
        "super8-augsburg","super8-chemnitz","super8-freiburg","super8-hamburg-mitte","super8-koblenz","super8-mainz-zollhafen","super8-munich-city-north",
        "super8-munich-city-west","super8-oberhausen","ona-hacienda-alamo") THEN 'Platinum'
        WHEN ${TABLE}.hotel_code IN ("alamos-benidorm","apartamentos-vall-boi","bahia-serena","dom-jose-beach","don-ramon","eco-europa","eco-sorra",
        "estudios-salinas","eurohotel-diagonal","gavimararielchico","gavimarcalagranhotel","gavimarlamirada","hospital-benasque","hotel-alay","hotel-myramar",
        "madeira-centro","maisonnave","malvasia","marmoris-alentejo","marmoris-camelia","marmoris-sintra","mediterraneo-park","monte-novo","montesol","nuriasol",
        "olympus-palace","palacio-maria-luisa","pato-amarillo","pato-rojo","pure-formosa","reino-anamaria","reino-granada","reino-nevado","reino-nevasur",
        "sno-aragon","sno-bielsa","sno-cerler","sno-colomers","sno-formigal","sno-villasallent3","valle-este","vidamar-villas","wine-books-porto",
        "wyndham-grand-cancun","xq-finca-salamanca","xq-palacete","xq-vistamar","yoy-edelweiss","yoy-isaba","yoy-mont-romies") THEN 'Silver'
        WHEN ${TABLE}.hotel_code IN ("casual-pop-art","casual-vintage-valencia","casual-socarrat","casual-don-juan-tenorio","casual-teatro-madrid",
        "casual-olas-sansebastian","casual-cine-valencia","casual-mar-malaga","casual-letras-sevilla","casual-duende","casual-rinascimiento-florencia",
        "casual-ilbira-granada","sanroque-garden","president-alcudia","blaumar-blaumar","villa-flamenca","ipv-palace","marsol-condado","marsol-blau",
        "marsol-hotel","marsol-encantada","acebuchal","aparthotel-bahia","aparthotel-dunas","ar-almerimar","ar-arcos","ar-golf-almerimar","ar-parquesur",
        "aranzazu-abando","aranzazu-carlton","axis-basic-braga","axis-casa-anquiao","axis-club","axis-ofir","axis-ponte-lima","axis-porto","axis-vermar",
        "axis-viana","azoris-angra","azoris-faial","azoris-royal","b4u-bilbao","b4u-pamplona","b4u-san-sebastianb4u-santander","b4u-tudela","b4u-zurriola",
        "bahia-cadiz","basic-manuela","basic-sevilla","bbou-cortijo","bbou-vinuela","benalmadena-beach","benalmadena-palace","bg-caballero","bg-ebeso",
        "bg-java","bg-pamplona","bg-portinatx","bg-rei-mediterrani","bg-tonga","blaumar-magnolia","blaumar-plaza","boho-marbella","casual-artes-valencia",
        "casual-belle-epoque","casual-cine-valencia","casual-civilizaciones","casual-colours","casual-don-juan-tenorio","casual-duende","casual-incas",
        "casual-jazz-sansebastian","casual-letras-sevilla","casual-mar-malaga","casual-musica-valencia","casual-olas-sansebastian","casual-pop-art",
        "casual-raizes","casual-rinascimiento-florencia","casual-socarrat","casual-teatro-madrid","casual-vintage-valencia","club-maspalomas","coronado",
        "cortijo-zahara","daguisa-canillo","daguisa-euroski","daguisa-goldenfenix","daguisa-pasdelacasa","daguisa-tulip","em-ande","em-azor","em-camelias",
        "em-cartagena","em-diez","em-solare","entremares-hotel","essence-donpaquito","estrellademar","fariones-apartamentos","fariones-suites",
        "flashhotelbenidorm","flipflop-cala-mandia","flipflop-cala-romantica","golfcenter","granpalas-experience","guitart-aptohotel-central","guitart-gold",
        "guitart-lamolina","guitart-passage","guitart-rosa","hn-negresco","hotansa-camelot","hotansa-cat-ski","hotansa-cervol","hotansa-comptes","hotansa-encamp",
        "hotansa-font","hotansa-gothard","hotansa-grand-pas","hotansa-himalaia","hotansa-magic-and","hotansa-marco-polo","hotansa-massana","hotansa-pas","hotansa-piolet",
        "hotansa-pui","hotansa-shusski","hotansa-ski","hotel-born","hotel-corregidor","hotel-don-pancho","hotel-guadalquivirhotel-luve","hotel-pintor","hotel-puentereal",
        "hotel-rosamar","ibersol-almunecar","ibersol-antemare","ibersol-aqquaria","ibersol-atriodelmar","ibersol-sorrador","ibersol-torremolinosbeach","isabel",
        "isla-mallorca","itaca-artemisa","itaca-jerez","itaca-moon-dreams-fuengirola","juderia-cordoba","juderia-sanfrancisco","juderia-sevilla","juderia-trinidad",
        "la-barracuda","lago-montargil","llum-arabi","llum-atlantic","llum-coral","llum-marina","llum-paraiso","luna-abrantes","luna-alvor-bay","luna-arcos",
        "luna-chales","luna-esperansa","luna-fatima","luna-miramar","luna-oceano","luna-olympus","luna-oura","luna-requeijo","luna-serra","luna-solaqua","luna-tabua",
        "marsol-blau","marsol-condado","marsol-encantada","marsol-hotel","mesaluna","mesaluna-short-long","mint-bannister","mint-naturacabana","ms-aguamarina","ms-alay",
        "ms-amaragua","ms-fuente","ms-maestranza","ms-tropicana","murillo-alcazar","murillo-apartamentos","murillo-segovias","murillo-sevilla","murillo-stacruz",
        "on-aleta-room","on-cityresort","on-palmbeach","on-residence","on-suite","onhotel","palau-apartments","playagolf-islantilla","posada-cordobes",
        "president-alcudia","primavera-loix","primavera-park","puerta-sevilla","puertobahia-spa","sand-beach","sanroque-garden","smy-aran-blu","smy-bologna-centrale",
        "smy-carlosv-alghero","smy-eulalia-algarve","smy-koflerhof-dolomiti","smy-kos","smy-lisboa","smy-mediterranean-white","smy-orizontes-santorini",
        "smy-santorini-suites","smy-tahona-fuerteventura","soho-atalia","soho-bahia","soho-cadiz","soho-canalejas","soho-capuchinos","soho-catalina","soho-catedral",
        "soho-colon","soho-columela","soho-congreso","soho-cordoba","soho-equitativa","soho-fernando","soho-gabriel","soho-jerez","soho-malaga","soho-moon-dreams",
        "soho-naranjos","soho-opera","soho-oviedo","soho-pombo","soho-puerto","soho-salamanca","soho-sevilla","soho-tiburon","soho-turia","soho-urban","soho-vegas",
        "soho-vistahermosa-hotel","toboso-almunecar","toboso-aparturis","toboso-plaza","torre-cristina","var-sanpedro","var-sierra-cazorla","vik-cayena",
        "vik-coralbeach","vik-costadelsol","vik-sanantonio","vik-villavik","zahara-beach","zahara-sol","b4u-san-sebastian","b4u-santander","hotel-guadalquivir",
        "hotel-luve") THEN 'GOLD'
        WHEN ${TABLE}.hotel_code IN ("summum-ventas","summum-rosellon","el-patio","maria-del-mar","casa-romana-boutique","08028-apartments","1888-triana-epoca",
        "1920-sevilla-epoca","4us-rioja-wine","abeto","abrigall-masella","acostacentro","acostamusica","acostavetonia","adaria-vera","agaro","alp-masella",
        "america-sevilla","aptos-chinitas","aqua-mar","arcos-nerja","arenacenter","arillo","ateneo","aubi","ayamontino","baia-cristal","baia-grande","baltum",
        "barcarola","bellavista","bibo-plazanueva","bienestar-moncao","bienestar-vizela","blau-cel","blau-mar","brisa-sol","brisamar-canteras","bs-capitulaciones",
        "bs-principe","buensol","casa-de-colon","casa-merced","casa-romana-boutique","casas-arenal","casas-novas","castro-marim","cervantes-sevilla","chinasol",
        "cidade-olhao","citymar-ciervo","citymar-embajador","citymar-montblanccitymar-santacruz","ciudadlugo","colina-paraiso","comaruga-platja","costamar",
        "derby-sevilla","diamar-lanzarote","diufain-conil","don-paco-malaga","ecorkhotel","ecuadorpark","eibar-rooms","el-camin","el-patio","empire-lisbon",
        "empire-marques-pombal","enigma-natura-water","epoca-sevilla-1855","esqina-cosmopolitan","esqina-urban","estacada","estrelladelnorte","europa-pamplona",
        "fay-victoria","feetup-nest-style","feetup-purple-nest-hostel","feetup-red-nest","feetup-youth-hostel","fenals-garden","fenix-beach","festival-village",
        "flatotelcostadelsol","fuengirola-beach","fuente-miro","fuentepark","gala-placidia","galanoja","gallo-rojo","ghm-aptos-bulgaria","ghm-aptos-gorbea",
        "ghm-aptos-monachil","ghm-aptos-sabica","gran-playa","gran-proa","greenland-bubble","horcajo","hostal-playa","hotel-bahiasur","hotel-baviera",
        "hotel-costa-caleta","hotel-dynastic","hotel-ghm","hotel-ipanema-beach","hotel-ipanema-park","hotel-iris","hotel-leyre","hotel-playa-real",
        "hotel-pradillo","hotel-sevilla","hotel-spa-congreso","hotel-victoria-playa","hotel-zen","hotelgransol","infanta-antequera","isabel-segura","jova",
        "la-mirage","lacala-suites","las-rampas","lasdunas","lesbrases","lescala-resort","lima-marbella","lisbon-best-choice","loule-jardim","macami",
        "maestranza-ronda","mareny-apartamentos","mareny-benidorm","mareny-hotel","maria-del-mar","mendeznunez","meridional-arcos","meridional-jerez",
        "meridional-quarteira","mh-florence","molino-enmedio","montemar-arcos","montepiedra","moon-sun-braga","moon-sun-porto","mscol-palacete","natura-algarve",
        "navegadores","noa-boutique","novo-sancti-petri","nuevoportil","nura-boreal","nura-condor","nura-ponsa","nura-rosa","oceanus-aparthotel","oriente-hostal",
        "oriente-suites","ourabay","palacio-corredera","palacio-don-pedro","paladim","park-plaza","pena-parda","peso-village","pineda-playa","pinhal-marina",
        "pinheiros-balaia","pio-apartments","playabarbate","plaza-cavana","plazuela-carbon","portobridges","prazer-natureza","princesa-playa","princesa-solar",
        "puerta-de-javalambre","puerto-palace","puntazo-2","puntazo-cantal","pyr-fuengirola","quinta-dos-machados","rali-viana","ramblas-barcelona","ramblas-vendrell",
        "raw-culture","regency-salgados","reyesol","rincon-granvia","sangil","sant-pere-bosc","sao-felixseayou-saplaya","seayou-valencia","selu","senhora-rosa",
        "sensation-authentic","sensation-sagrada","sevillaalmeria","simon-sevilla","singular-ferrero","singular-la-escondida","singular-montico","singular-toloriu",
        "sirena-3","sol-y-miel","solar-alvura","soratama","sorrabona","stella-maris","suites-pintor","sul-villas","summum-ratxo","summum-rosellon","tarik","torre-nunez",
        "traina","tropical-sol","ur-avenida","ur-m-house","ur-portofino","urban-dream-granada","urban-dream-nevada","urban-dream-torrox","urbansense-bellagranada",
        "urbansense-bellasevilla","urbansense-hostelsevilla","urbansense-oboegranada","urbansense-oboemadrid","urbansense-oboesevillai","urbansense-oboesevillaii",
        "v-vejer","valderrabanos","vale-dazenha","vasco-gama","viadero","vila-petra","vilagaros","villa-frigiliana","villamarina","zeus","zeus-malaga",
        "citymar-montblanc","citymar-santacruz","hotel-royal-costa","sao-felix","seayou-saplaya") THEN 'BRONZE'
         WHEN ${TABLE}.hotel_code IN ("ahc-lowcost","ahc-palacio-coria","choromar","do-parque","don-manuel","douro-palace","douro-royal","hemd-gloria",
        "hemd-puertareal","hemd-sanandres","hemd-zaida","hotel-embarcadero","hotel-ninays","hotel-orquidea","oasis-conil-hotel","parkhouse-101",
        "rainha-isabel","sa-amaro","sa-serra","sarga","serenity-boutique","sierra-arcos","tejera","torre-quintana","vista-real","campanario","sesimbra") THEN 'LITE'
        when ${TABLE}.hotel_code IN ("albero","alboran-algeciras","alboran-chiclana","bcl-levante-club","bcl-levante-lux","bcl-levante-spa","clube-maria-luisa",
        "fhb-agaves","fhb-casa-florida","fhb-casa-liza","fhb-casa88","fhb-casaluna-boutique","fhb-mansion-bosque","fhb-maria-bonita","fhb-maria-isabela",
        "fhb-milkaella","fhb-portal-miguel-allende","fhb-quetzal","flavia","greco-antidoto","greco-pintor","hotel-santa-rosa","hotel-veintiuno","jardin-reina",
        "lineros","miramar-cantabria","mogay","montiel","nahuel-huapi","palm-playa","quinta-pedra","san-marcos","santuario-spa","spiwak-chipichape",
        "spiwak-spirito","tracos-doutrora","tranquilo-puerto-dreams","urh-moli-del-mig","varandas","veramar","yellow-praia") THEN 'BAJA'
        ELSE 'NO SCORING'
    END ;;}

  dimension: scoring_format {
    sql: ${scoring} ;;
    html: {% if value == 'Platinum' %}
      <p style="color: black; background-color: lightblue; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == 'GOLD' %}
      <p style="color: black; background-color: GOLD; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == 'Silver' %}
      <p style="color: black; background-color: Silver; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == 'BRONZE' %}
      <p style="color: black; background-color: orange; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == 'LITE' %}
      <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
      <p style="color: black; background-color: white; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %};;
  }


}
