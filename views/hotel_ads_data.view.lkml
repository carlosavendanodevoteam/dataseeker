# The name of this view in Looker is "Hotel Ads Data"
view: hotel_ads_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `Google_ads_dataset.HOTEL_ADS_DATA` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Average Cpc" in Explore.

  dimension: average_cpc {
    type: number
    sql: ${TABLE}.average_cpc ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_type {
    type: string
    sql: ${TABLE}.campaign_type ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost {
    type: sum
    sql: ${cost} ;;  }
  measure: average_cost {
    type: average
    sql: ${cost} ;;  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.ctr ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: conversionsValue {
    type: number
    sql: ${TABLE}.conversionsValue ;;
  }

  dimension: eligible_impressions {
    type: number
    sql: ${TABLE}.eligible_impressions ;;
  }

  dimension: cost_percent{
    type: number
    sql: Case
          when ${campaign_name} like '%3%' then 3
          when ${campaign_name} like '%4%' then 4
          when ${campaign_name} like '%5%' then 5
          when ${campaign_name} like '%6%' then 6
          when ${campaign_name} like '%7%' then 7
          when ${campaign_name} like '%8%' then 8
          when ${campaign_name} like '%9%' then 9
          when ${campaign_name} like '%10%' then 10
          when ${campaign_name} like '%11%' then 11
          when ${campaign_name} like '%12%' then 12
          when ${campaign_name} like '%13%' then 13
          when ${campaign_name} like '%14%' then 14
          when ${campaign_name} like '%15%' then 15
          when ${campaign_name} like '%16%' then 16
          when ${campaign_name} like '%17%' then 17
          when ${campaign_name} like '%18%' then 18
          when ${campaign_name} like '%19%' then 19
          when ${campaign_name} like '%20%' then 20
          when ${campaign_name} like '%1%' then 1
          when ${campaign_name} like '%2%' then 2
          else 0
        End;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partition_timestamp ;;
  }
  measure: count {
    type: count
    drill_fields: [campaign_name]
  }

  measure: commission {
    type: number
    sql: ${TABLE}.commission_percent ;; #DIVIDIR POR 1000000 PARA SACAR EL VALOR EXACTO
  }

  dimension: hotel_price_bucket {
    type:  string
    sql: ${TABLE}.hotel_price_bucket ;;
  }

  dimension: hotel_price_difference_percentage {
    type: number
    sql: ${TABLE}.hotel_price_difference_percentage ;;
  }

  measure: Impression_share{
    type: number
    sql: sum(${impressions}) / sum(${eligible_impressions}) ;;
  }

  dimension: country {
    type: string
    sql: CASE
          WHEN ${TABLE}.country = 'geoTargetConstants/2004' then 'Afghanistan'
          WHEN ${TABLE}.country = 'geoTargetConstants/2008' then 'Albania'
          WHEN ${TABLE}.country = 'geoTargetConstants/2012' then 'Algeria'
          WHEN ${TABLE}.country = 'geoTargetConstants/2016' then 'American Samoa'
          WHEN ${TABLE}.country = 'geoTargetConstants/2020' then 'Andorra'
          WHEN ${TABLE}.country = 'geoTargetConstants/2024' then 'Angola'
          WHEN ${TABLE}.country = 'geoTargetConstants/2010' then 'Antarctica'
          WHEN ${TABLE}.country = 'geoTargetConstants/2028' then 'Antigua and Barbuda'
          WHEN ${TABLE}.country = 'geoTargetConstants/2032' then 'Argentina'
          WHEN ${TABLE}.country = 'geoTargetConstants/2051' then 'Armenia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2036' then 'Australia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2040' then 'Austria'
          WHEN ${TABLE}.country = 'geoTargetConstants/2031' then 'Azerbaijan'
          WHEN ${TABLE}.country = 'geoTargetConstants/2048' then 'Bahrain'
          WHEN ${TABLE}.country = 'geoTargetConstants/2050' then 'Bangladesh'
          WHEN ${TABLE}.country = 'geoTargetConstants/2052' then 'Barbados'
          WHEN ${TABLE}.country = 'geoTargetConstants/2112' then 'Belarus'
          WHEN ${TABLE}.country = 'geoTargetConstants/2056' then 'Belgium'
          WHEN ${TABLE}.country = 'geoTargetConstants/2084' then 'Belize'
          WHEN ${TABLE}.country = 'geoTargetConstants/2204' then 'Benin'
          WHEN ${TABLE}.country = 'geoTargetConstants/2064' then 'Bhutan'
          WHEN ${TABLE}.country = 'geoTargetConstants/2068' then 'Bolivia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2070' then 'Bosnia and Herzegovina'
          WHEN ${TABLE}.country = 'geoTargetConstants/2072' then 'Botswana'
          WHEN ${TABLE}.country = 'geoTargetConstants/2076' then 'Brazil'
          WHEN ${TABLE}.country = 'geoTargetConstants/2096' then 'Brunei'
          WHEN ${TABLE}.country = 'geoTargetConstants/2100' then 'Bulgaria'
          WHEN ${TABLE}.country = 'geoTargetConstants/2854' then 'Burkina Faso'
          WHEN ${TABLE}.country = 'geoTargetConstants/2108' then 'Burundi'
          WHEN ${TABLE}.country = 'geoTargetConstants/2116' then 'Cambodia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2120' then 'Cameroon'
          WHEN ${TABLE}.country = 'geoTargetConstants/2124' then 'Canada'
          WHEN ${TABLE}.country = 'geoTargetConstants/2132' then 'Cape Verde'
          WHEN ${TABLE}.country = 'geoTargetConstants/2535' then 'Caribbean Netherlands'
          WHEN ${TABLE}.country = 'geoTargetConstants/2140' then 'Central African Republic'
          WHEN ${TABLE}.country = 'geoTargetConstants/2148' then 'Chad'
          WHEN ${TABLE}.country = 'geoTargetConstants/2152' then 'Chile'
          WHEN ${TABLE}.country = 'geoTargetConstants/2156' then 'China'
          WHEN ${TABLE}.country = 'geoTargetConstants/2162' then 'Christmas Island'
          WHEN ${TABLE}.country = 'geoTargetConstants/2166' then 'Cocos (Keeling) Islands'
          WHEN ${TABLE}.country = 'geoTargetConstants/2170' then 'Colombia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2174' then 'Comoros'
          WHEN ${TABLE}.country = 'geoTargetConstants/2184' then 'Cook Islands'
          WHEN ${TABLE}.country = 'geoTargetConstants/2188' then 'Costa Rica'
          WHEN ${TABLE}.country = 'geoTargetConstants/2384' then "Cote d'Ivoire"
          WHEN ${TABLE}.country = 'geoTargetConstants/2191' then 'Croatia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2531' then 'Curacao'
          WHEN ${TABLE}.country = 'geoTargetConstants/2196' then 'Cyprus'
          WHEN ${TABLE}.country = 'geoTargetConstants/2203' then 'Czechia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2180' then 'Democratic Republic of the Congo'
          WHEN ${TABLE}.country = 'geoTargetConstants/2208' then 'Denmark'
          WHEN ${TABLE}.country = 'geoTargetConstants/2262' then 'Djibouti'
          WHEN ${TABLE}.country = 'geoTargetConstants/2212' then 'Dominica'
          WHEN ${TABLE}.country = 'geoTargetConstants/2214' then 'Dominican Republic'
          WHEN ${TABLE}.country = 'geoTargetConstants/2218' then 'Ecuador'
          WHEN ${TABLE}.country = 'geoTargetConstants/2818' then 'Egypt'
          WHEN ${TABLE}.country = 'geoTargetConstants/2222' then 'El Salvador'
          WHEN ${TABLE}.country = 'geoTargetConstants/2226' then 'Equatorial Guinea'
          WHEN ${TABLE}.country = 'geoTargetConstants/2232' then 'Eritrea'
          WHEN ${TABLE}.country = 'geoTargetConstants/2233' then 'Estonia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2748' then 'Eswatini'
          WHEN ${TABLE}.country = 'geoTargetConstants/2231' then 'Ethiopia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2583' then 'Federated States of Micronesia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2242' then 'Fiji'
          WHEN ${TABLE}.country = 'geoTargetConstants/2246' then 'Finland'
          WHEN ${TABLE}.country = 'geoTargetConstants/2250' then 'France'
          WHEN ${TABLE}.country = 'geoTargetConstants/2258' then 'French Polynesia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2260' then 'French Southern and Antarctic Lands'
          WHEN ${TABLE}.country = 'geoTargetConstants/2266' then 'Gabon'
          WHEN ${TABLE}.country = 'geoTargetConstants/2268' then 'Georgia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2276' then 'Germany'
          WHEN ${TABLE}.country = 'geoTargetConstants/2288' then 'Ghana'
          WHEN ${TABLE}.country = 'geoTargetConstants/2300' then 'Greece'
          WHEN ${TABLE}.country = 'geoTargetConstants/2308' then 'Grenada'
          WHEN ${TABLE}.country = 'geoTargetConstants/2316' then 'Guam'
          WHEN ${TABLE}.country = 'geoTargetConstants/2320' then 'Guatemala'
          WHEN ${TABLE}.country = 'geoTargetConstants/2831' then 'Guernsey'
          WHEN ${TABLE}.country = 'geoTargetConstants/2324' then 'Guinea'
          WHEN ${TABLE}.country = 'geoTargetConstants/2624' then 'Guinea-Bissau'
          WHEN ${TABLE}.country = 'geoTargetConstants/2328' then 'Guyana'
          WHEN ${TABLE}.country = 'geoTargetConstants/2332' then 'Haiti'
          WHEN ${TABLE}.country = 'geoTargetConstants/2334' then 'Heard Island and McDonald Islands'
          WHEN ${TABLE}.country = 'geoTargetConstants/2340' then 'Honduras'
          WHEN ${TABLE}.country = 'geoTargetConstants/2348' then 'Hungary'
          WHEN ${TABLE}.country = 'geoTargetConstants/2352' then 'Iceland'
          WHEN ${TABLE}.country = 'geoTargetConstants/2356' then 'India'
          WHEN ${TABLE}.country = 'geoTargetConstants/2360' then 'Indonesia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2368' then 'Iraq'
          WHEN ${TABLE}.country = 'geoTargetConstants/2372' then 'Ireland'
          WHEN ${TABLE}.country = 'geoTargetConstants/2376' then 'Israel'
          WHEN ${TABLE}.country = 'geoTargetConstants/2380' then 'Italy'
          WHEN ${TABLE}.country = 'geoTargetConstants/2388' then 'Jamaica'
          WHEN ${TABLE}.country = 'geoTargetConstants/2392' then 'Japan'
          WHEN ${TABLE}.country = 'geoTargetConstants/2832' then 'Jersey'
          WHEN ${TABLE}.country = 'geoTargetConstants/2400' then 'Jordan'
          WHEN ${TABLE}.country = 'geoTargetConstants/2398' then 'Kazakhstan'
          WHEN ${TABLE}.country = 'geoTargetConstants/2404' then 'Kenya'
          WHEN ${TABLE}.country = 'geoTargetConstants/2296' then 'Kiribati'
          WHEN ${TABLE}.country = 'geoTargetConstants/2414' then 'Kuwait'
          WHEN ${TABLE}.country = 'geoTargetConstants/2417' then 'Kyrgyzstan'
          WHEN ${TABLE}.country = 'geoTargetConstants/2418' then 'Laos'
          WHEN ${TABLE}.country = 'geoTargetConstants/2428' then 'Latvia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2422' then 'Lebanon'
          WHEN ${TABLE}.country = 'geoTargetConstants/2426' then 'Lesotho'
          WHEN ${TABLE}.country = 'geoTargetConstants/2430' then 'Liberia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2434' then 'Libya'
          WHEN ${TABLE}.country = 'geoTargetConstants/2438' then 'Liechtenstein'
          WHEN ${TABLE}.country = 'geoTargetConstants/2440' then 'Lithuania'
          WHEN ${TABLE}.country = 'geoTargetConstants/2442' then 'Luxembourg'
          WHEN ${TABLE}.country = 'geoTargetConstants/2450' then 'Madagascar'
          WHEN ${TABLE}.country = 'geoTargetConstants/2454' then 'Malawi'
          WHEN ${TABLE}.country = 'geoTargetConstants/2458' then 'Malaysia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2462' then 'Maldives'
          WHEN ${TABLE}.country = 'geoTargetConstants/2466' then 'Mali'
          WHEN ${TABLE}.country = 'geoTargetConstants/2470' then 'Malta'
          WHEN ${TABLE}.country = 'geoTargetConstants/2584' then 'Marshall Islands'
          WHEN ${TABLE}.country = 'geoTargetConstants/2478' then 'Mauritania'
          WHEN ${TABLE}.country = 'geoTargetConstants/2480' then 'Mauritius'
          WHEN ${TABLE}.country = 'geoTargetConstants/2484' then 'Mexico'
          WHEN ${TABLE}.country = 'geoTargetConstants/2498' then 'Moldova'
          WHEN ${TABLE}.country = 'geoTargetConstants/2492' then 'Monaco'
          WHEN ${TABLE}.country = 'geoTargetConstants/2496' then 'Mongolia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2499' then 'Montenegro'
          WHEN ${TABLE}.country = 'geoTargetConstants/2504' then 'Morocco'
          WHEN ${TABLE}.country = 'geoTargetConstants/2508' then 'Mozambique'
          WHEN ${TABLE}.country = 'geoTargetConstants/2104' then 'Myanmar (Burma)'
          WHEN ${TABLE}.country = 'geoTargetConstants/2516' then 'Namibia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2520' then 'Nauru'
          WHEN ${TABLE}.country = 'geoTargetConstants/2524' then 'Nepal'
          WHEN ${TABLE}.country = 'geoTargetConstants/2528' then 'Netherlands'
          WHEN ${TABLE}.country = 'geoTargetConstants/2540' then 'New Caledonia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2554' then 'New Zealand'
          WHEN ${TABLE}.country = 'geoTargetConstants/2558' then 'Nicaragua'
          WHEN ${TABLE}.country = 'geoTargetConstants/2562' then 'Niger'
          WHEN ${TABLE}.country = 'geoTargetConstants/2566' then 'Nigeria'
          WHEN ${TABLE}.country = 'geoTargetConstants/2570' then 'Niue'
          WHEN ${TABLE}.country = 'geoTargetConstants/2574' then 'Norfolk Island'
          WHEN ${TABLE}.country = 'geoTargetConstants/2807' then 'North Macedonia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2580' then 'Northern Mariana Islands'
          WHEN ${TABLE}.country = 'geoTargetConstants/2578' then 'Norway'
          WHEN ${TABLE}.country = 'geoTargetConstants/2512' then 'Oman'
          WHEN ${TABLE}.country = 'geoTargetConstants/2586' then 'Pakistan'
          WHEN ${TABLE}.country = 'geoTargetConstants/2585' then 'Palau'
          WHEN ${TABLE}.country = 'geoTargetConstants/2591' then 'Panama'
          WHEN ${TABLE}.country = 'geoTargetConstants/2598' then 'Papua New Guinea'
          WHEN ${TABLE}.country = 'geoTargetConstants/2600' then 'Paraguay'
          WHEN ${TABLE}.country = 'geoTargetConstants/2604' then 'Peru'
          WHEN ${TABLE}.country = 'geoTargetConstants/2608' then 'Philippines'
          WHEN ${TABLE}.country = 'geoTargetConstants/2612' then 'Pitcairn Islands'
          WHEN ${TABLE}.country = 'geoTargetConstants/2616' then 'Poland'
          WHEN ${TABLE}.country = 'geoTargetConstants/2620' then 'Portugal'
          WHEN ${TABLE}.country = 'geoTargetConstants/2634' then 'Qatar'
          WHEN ${TABLE}.country = 'geoTargetConstants/2178' then 'Republic of the Congo'
          WHEN ${TABLE}.country = 'geoTargetConstants/2642' then 'Romania'
          WHEN ${TABLE}.country = 'geoTargetConstants/2643' then 'Russia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2646' then 'Rwanda'
          WHEN ${TABLE}.country = 'geoTargetConstants/2652' then 'Saint Barthelemy'
          WHEN ${TABLE}.country = 'geoTargetConstants/2654' then 'Saint Helena, Ascension and Tristan da Cunha'
          WHEN ${TABLE}.country = 'geoTargetConstants/2659' then 'Saint Kitts and Nevis'
          WHEN ${TABLE}.country = 'geoTargetConstants/2662' then 'Saint Lucia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2663' then 'Saint Martin'
          WHEN ${TABLE}.country = 'geoTargetConstants/2666' then 'Saint Pierre and Miquelon'
          WHEN ${TABLE}.country = 'geoTargetConstants/2670' then 'Saint Vincent and the Grenadines'
          WHEN ${TABLE}.country = 'geoTargetConstants/2882' then 'Samoa'
          WHEN ${TABLE}.country = 'geoTargetConstants/2674' then 'San Marino'
          WHEN ${TABLE}.country = 'geoTargetConstants/2678' then 'Sao Tome and Principe'
          WHEN ${TABLE}.country = 'geoTargetConstants/2682' then 'Saudi Arabia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2686' then 'Senegal'
          WHEN ${TABLE}.country = 'geoTargetConstants/2688' then 'Serbia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2690' then 'Seychelles'
          WHEN ${TABLE}.country = 'geoTargetConstants/2694' then 'Sierra Leone'
          WHEN ${TABLE}.country = 'geoTargetConstants/2702' then 'Singapore'
          WHEN ${TABLE}.country = 'geoTargetConstants/2534' then 'Sint Maarten'
          WHEN ${TABLE}.country = 'geoTargetConstants/2703' then 'Slovakia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2705' then 'Slovenia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2090' then 'Solomon Islands'
          WHEN ${TABLE}.country = 'geoTargetConstants/2706' then 'Somalia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2710' then 'South Africa'
          WHEN ${TABLE}.country = 'geoTargetConstants/2239' then 'South Georgia and the South Sandwich Islands'
          WHEN ${TABLE}.country = 'geoTargetConstants/2410' then 'South Korea'
          WHEN ${TABLE}.country = 'geoTargetConstants/2728' then 'South Sudan'
          WHEN ${TABLE}.country = 'geoTargetConstants/2724' then 'Spain'
          WHEN ${TABLE}.country = 'geoTargetConstants/2144' then 'Sri Lanka'
          WHEN ${TABLE}.country = 'geoTargetConstants/2736' then 'Sudan'
          WHEN ${TABLE}.country = 'geoTargetConstants/2740' then 'Suriname'
          WHEN ${TABLE}.country = 'geoTargetConstants/2752' then 'Sweden'
          WHEN ${TABLE}.country = 'geoTargetConstants/2756' then 'Switzerland'
          WHEN ${TABLE}.country = 'geoTargetConstants/2158' then 'Taiwan'
          WHEN ${TABLE}.country = 'geoTargetConstants/2762' then 'Tajikistan'
          WHEN ${TABLE}.country = 'geoTargetConstants/2834' then 'Tanzania'
          WHEN ${TABLE}.country = 'geoTargetConstants/2764' then 'Thailand'
          WHEN ${TABLE}.country = 'geoTargetConstants/2044' then 'The Bahamas'
          WHEN ${TABLE}.country = 'geoTargetConstants/2270' then 'The Gambia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2626' then 'Timor-Leste'
          WHEN ${TABLE}.country = 'geoTargetConstants/2768' then 'Togo'
          WHEN ${TABLE}.country = 'geoTargetConstants/2772' then 'Tokelau'
          WHEN ${TABLE}.country = 'geoTargetConstants/2776' then 'Tonga'
          WHEN ${TABLE}.country = 'geoTargetConstants/2780' then 'Trinidad and Tobago'
          WHEN ${TABLE}.country = 'geoTargetConstants/2788' then 'Tunisia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2792' then 'Turkey'
          WHEN ${TABLE}.country = 'geoTargetConstants/2795' then 'Turkmenistan'
          WHEN ${TABLE}.country = 'geoTargetConstants/2798' then 'Tuvalu'
          WHEN ${TABLE}.country = 'geoTargetConstants/2800' then 'Uganda'
          WHEN ${TABLE}.country = 'geoTargetConstants/2804' then 'Ukraine'
          WHEN ${TABLE}.country = 'geoTargetConstants/2784' then 'United Arab Emirates'
          WHEN ${TABLE}.country = 'geoTargetConstants/2826' then 'United Kingdom'
          WHEN ${TABLE}.country = 'geoTargetConstants/2840' then 'United States'
          WHEN ${TABLE}.country = 'geoTargetConstants/2581' then 'United States Minor Outlying Islands'
          WHEN ${TABLE}.country = 'geoTargetConstants/2858' then 'Uruguay'
          WHEN ${TABLE}.country = 'geoTargetConstants/2860' then 'Uzbekistan'
          WHEN ${TABLE}.country = 'geoTargetConstants/2548' then 'Vanuatu'
          WHEN ${TABLE}.country = 'geoTargetConstants/2336' then 'Vatican City'
          WHEN ${TABLE}.country = 'geoTargetConstants/2862' then 'Venezuela'
          WHEN ${TABLE}.country = 'geoTargetConstants/2704' then 'Vietnam'
          WHEN ${TABLE}.country = 'geoTargetConstants/2876' then 'Wallis and Futuna'
          WHEN ${TABLE}.country = 'geoTargetConstants/2887' then 'Yemen'
          WHEN ${TABLE}.country = 'geoTargetConstants/2894' then 'Zambia'
          WHEN ${TABLE}.country = 'geoTargetConstants/2716' then 'Zimbabwe'
          Else ${TABLE}.country
        END;;
  }

}
