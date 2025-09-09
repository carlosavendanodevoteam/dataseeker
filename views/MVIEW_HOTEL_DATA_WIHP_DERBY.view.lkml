view: MVIEW_HOTEL_DATA_WIHP_DERBY {
  sql_table_name: `bi_dataset.MVIEW_HOTEL_DATA_WIHP_DERBY` ;;

  dimension: avg_hotel_price_diff {
    type: number
    sql: ${TABLE}.avg_hotel_price_diff ;;
  }
  dimension: sum_booking {
    type: number
    sql: ${TABLE}.sum_booking ;;
  }
  dimension: sum_clicks {
    type: number
    sql: ${TABLE}.sum_clicks ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }
  dimension: origin {
    type: string
    sql: ${TABLE}.origin ;;
  }
  dimension: sum_elegible_impresion {
    type: number
    sql: ${TABLE}.sum_elegible_impresion ;;
  }

  dimension: hotel_code {
    primary_key: yes
    type: string
    sql: ${TABLE}.hotel_code ;;
  }
  dimension: sum_impr {
    type: number
    sql: ${TABLE}.sum_impr ;;
  }
  dimension: market {
    type: string
    sql: upper(${TABLE}.market) ;;
  }
  dimension: full_market {
    # Nueva dimensión para los nombres completos de los países
    type: string
    sql: CASE
      WHEN ${market} = 'ES' or ${market} like 'ESPAÑ%' THEN 'Spain'
      WHEN ${market} = 'CN' THEN 'China'
      WHEN ${market} = 'TR' THEN 'Turkey'
      WHEN ${market} = 'SH' THEN 'Saint Helena'
      WHEN ${market} = 'TL' THEN 'East Timor'
      WHEN ${market} = 'VG' THEN 'British Virgin Islands'
      WHEN ${market} = 'TT' THEN 'Trinidad and Tobago'
      WHEN ${market} = 'KH' THEN 'Cambodia'
      WHEN ${market} = 'RE' THEN 'Reunion Island'
      WHEN ${market} = 'SK' THEN 'Slovakia'
      WHEN ${market} = 'BH' THEN 'Bahrain'
      WHEN ${market} = 'GT' THEN 'Guatemala'
      WHEN ${market} = 'FJ' THEN 'Fiji'
      WHEN ${market} = 'NZ' THEN 'New Zealand'
      WHEN ${market} = 'TC' THEN 'Turks and Caicos Islands'
      WHEN ${market} = 'FO' THEN 'Faroe Islands'
      WHEN ${market} = 'JE' THEN 'Jersey'
      WHEN ${market} = 'KZ' THEN 'Kazakhstan'
      WHEN ${market} = 'TO' THEN 'Tonga'
      WHEN ${market} = 'TV' THEN 'Tuvalu'
      WHEN ${market} = 'KE' THEN 'Kenya'
      WHEN ${market} = 'UM' THEN 'United States Minor Outlying Islands'
      WHEN ${market} = 'BR' THEN 'Brasil'
      WHEN ${market} = 'IR' THEN 'Irán'
      WHEN ${market} = 'AF' THEN 'Afghanistan'
      WHEN ${market} = 'EC' THEN 'Ecuador'
      WHEN ${market} = 'CY' THEN 'Cyprus'
      WHEN ${market} = 'SZ' THEN 'Eswatini'
      WHEN ${market} = 'FI' THEN 'Finland'
      WHEN ${market} = 'GN' THEN 'Guinea'
      WHEN ${market} = 'GY' THEN 'Guyana'
      WHEN ${market} = 'MF' THEN 'Saint Martin'
      WHEN ${market} = 'SI' THEN 'Slovenia'
      WHEN ${market} = 'AO' THEN 'Angola'
      WHEN ${market} = 'PW' THEN 'Palau'
      WHEN ${market} = 'DO' THEN 'República Dominicana'
      WHEN ${market} = 'TM' THEN 'Turkmenistán'
      WHEN ${market} = 'TN' THEN 'Tunisia'
      WHEN ${market} = 'UG' THEN 'Uganda'
      WHEN ${market} = 'BD' THEN 'Bangladesh'
      WHEN ${market} = 'FR' or ${market} = 'FRANCIA' THEN 'France'
      WHEN ${market} = 'CZ' THEN 'República Checa'
      WHEN ${market} = 'ST' THEN 'São Tomé and Príncipe'
      WHEN ${market} = 'OM' THEN 'Omán'
      WHEN ${market} = 'ZW' THEN 'Zimbabwe'
      WHEN ${market} = 'PF' THEN 'French Polynesia'
      WHEN ${market} = 'A1' THEN 'Anonymous Proxy'
      WHEN ${market} = 'LY' THEN 'Libia'
      WHEN ${market} = 'BM' THEN 'Bermudas'
      WHEN ${market} = 'TJ' THEN 'Tajikistan'
      WHEN ${market} = 'PT' THEN 'Portugal'
      WHEN ${market} = 'CA' THEN 'Canadá'
      WHEN ${market} = 'MC' THEN 'Mónaco'
      WHEN ${market} = 'UZ' THEN 'Uzbekistán'
      WHEN ${market} = 'SR' THEN 'Surinam'
      WHEN ${market} = 'GB' or ${market} = 'UNITED KINGDOM OF GREAT BRITAIN AND NORTHERN IRELAND' THEN 'United Kingdom'
      WHEN ${market} = 'EG' THEN 'Egipto'
      WHEN ${market} = 'PM' THEN 'Saint Pierre and Miquelon'
      WHEN ${market} = 'VN' THEN 'Vietnam'
      WHEN ${market} = 'SG' THEN 'Singapore'
      WHEN ${market} = 'SJ' THEN 'Svalbard and Jan Mayen'
      WHEN ${market} = 'AQ' THEN 'Antarctica'
      WHEN ${market} = 'IS' THEN 'Iceland'
      WHEN ${market} = 'GL' THEN 'Greenland'
      WHEN ${market} = 'YT' THEN 'Mayotte'
      WHEN ${market} = 'NL' THEN 'Netherlands'
      WHEN ${market} = 'US' THEN 'United States'
      WHEN ${market} = 'CH' THEN 'Switzerland'
      WHEN ${market} = 'MZ' THEN 'Mozambique'
      WHEN ${market} = 'KR' THEN 'South Korea'
      WHEN ${market} = 'MD' THEN 'Moldova'
      WHEN ${market} = 'TZ' THEN 'Tanzania'
      WHEN ${market} = 'FM' THEN 'Micronesia'
      WHEN ${market} = 'RW' THEN 'Rwanda'
      WHEN ${market} = 'UY' THEN 'Uruguay'
      WHEN ${market} = 'BZ' THEN 'Belize'
      WHEN ${market} = 'LT' THEN 'Lithuania'
      WHEN ${market} = 'DJ' THEN 'Djibouti'
      WHEN ${market} = 'CC' THEN 'Cocos Islands'
      WHEN ${market} = 'ZA' THEN 'South Africa'
      WHEN ${market} = 'DE' THEN 'Germany'
      WHEN ${market} = 'GE' THEN 'Georgia'
      WHEN ${market} = 'AR' THEN 'Argentina'
      WHEN ${market} = 'TD' THEN 'Chad'
      WHEN ${market} = 'PT' THEN 'Portugal'
      WHEN ${market} = 'CU' THEN 'Cuba'
      WHEN ${market} = 'CG' THEN 'Congo'
      WHEN ${market} = 'BA' THEN 'Bosnia and Herzegovina'
      WHEN ${market} = 'US' THEN 'United States'
      WHEN ${market} = 'BJ' THEN 'Benin'
      WHEN ${market} = 'HK' THEN 'Hong Kong'
      WHEN ${market} = 'HM' THEN 'Heard Island and McDonald Islands'
      WHEN ${market} = 'GI' THEN 'Gibraltar'
      WHEN ${market} = 'MG' THEN 'Madagascar'
      WHEN ${market} = 'FR' THEN 'France'
      WHEN ${market} = 'MQ' THEN 'Martinique'
      WHEN ${market} = 'MA' THEN 'Morocco'
      WHEN ${market} = 'AU' THEN 'Australia'
      WHEN ${market} = 'BS' THEN 'Bahamas'
      WHEN ${market} = 'LC' THEN 'Saint Lucia'
      WHEN ${market} = 'SV' THEN 'El Salvador'
      WHEN ${market} = 'CV' THEN 'Cabo Verde'
      WHEN ${market} = 'KG' THEN 'Kyrgyzstan'
      WHEN ${market} = 'ML' THEN 'Mali'
      WHEN ${market} = 'MV' THEN 'Maldives'
      WHEN ${market} = 'BI' THEN 'Burundi'
      WHEN ${market} = 'KP' THEN 'North Korea'
      WHEN ${market} = 'GF' THEN 'French Guiana'
      WHEN ${market} = 'DK' THEN 'Denmark'
      WHEN ${market} = 'GD' THEN 'Grenada'
      WHEN ${market} = 'CF' THEN 'Central African Republic'
      WHEN ${market} = 'JM' THEN 'Jamaica'
      WHEN ${market} = 'PR' THEN 'Puerto Rico'
      WHEN ${market} = 'PY' THEN 'Paraguay'
      WHEN ${market} = 'CK' THEN 'Cook Islands'
      WHEN ${market} = 'CI' THEN 'Ivory Coast'
      WHEN ${market} = 'ME' THEN 'Montenegro'
      WHEN ${market} = 'PT' THEN 'Portugal'
      WHEN ${market} = 'JP' THEN 'Japan'
      WHEN ${market} = 'MU' THEN 'Mauritius'
      WHEN ${market} = 'IQ' THEN 'Iraq'
      WHEN ${market} = 'BE' THEN 'Belgium'
      WHEN ${market} = 'NO' THEN 'Norway'
      WHEN ${market} = 'SC' THEN 'Seychelles'
      WHEN ${market} = 'GQ' THEN 'Equatorial Guinea'
      WHEN ${market} = 'AL' THEN 'Albania'
      WHEN ${market} = 'MK' THEN 'North Macedonia'
      WHEN ${market} = 'YE' THEN 'Yemen'
      WHEN ${market} = 'GA' THEN 'Gabon'
      WHEN ${market} = 'LB' THEN 'Lebanon'
      WHEN ${market} = 'MR' THEN 'Mauritania'
      WHEN ${market} = 'SM' THEN 'San Marino'
      WHEN ${market} = 'VA' THEN 'Vatican City'
      WHEN ${market} = 'SA' THEN 'Saudi Arabia'
      WHEN ${market} = 'AN' THEN 'Netherlands Antilles'
      WHEN ${market} = 'CX' THEN 'Christmas Island'
      WHEN ${market} = 'KY' THEN 'Cayman Islands'
      WHEN ${market} = 'SE' THEN 'Sweden'
      WHEN ${market} = 'TW' THEN 'Taiwan'
      WHEN ${market} = 'NI' THEN 'Nicaragua'
      WHEN ${market} = 'UA' THEN 'Ukraine'
      WHEN ${market} = 'CA' THEN 'Canada'
      WHEN ${market} = 'ER' THEN 'Eritrea'
      WHEN ${market} = 'CW' THEN 'Curaçao'
      WHEN ${market} = 'BW' THEN 'Botswana'
      WHEN ${market} = 'GH' THEN 'Ghana'
      WHEN ${market} = 'AD' THEN 'Andorra'
      WHEN ${market} = 'MO' THEN 'Macao'
      WHEN ${market} = 'IE' THEN 'Ireland'
      WHEN ${market} = 'IT' THEN 'Italy'
      WHEN ${market} = 'PA' THEN 'Panama'
      WHEN ${market} = 'PN' THEN 'Pitcairn'
      WHEN ${market} = 'IM' THEN 'Isle of Man'
      WHEN ${market} = 'MY' THEN 'Malaysia'
      WHEN ${market} = 'MN' THEN 'Mongolia'
      WHEN ${market} = 'GP' THEN 'Guadeloupe'
      WHEN ${market} = 'LR' THEN 'Liberia'
      WHEN ${market} = 'P' THEN 'Pakistan'
      WHEN ${market} = 'MX' THEN 'Mexico'
      WHEN ${market} = 'NP' THEN 'Nepal'
      WHEN ${market} = 'ES' THEN 'Spain'
      WHEN ${market} = 'ET' THEN 'Ethiopia'
      WHEN ${market} = 'CS' THEN 'Serbia and Montenegro'
      WHEN ${market} = 'BF' THEN 'Burkina Faso'
      WHEN ${market} = 'AS' THEN 'American Samoa'
      WHEN ${market} = 'VI' THEN 'U.S. Virgin Islands'
      WHEN ${market} = 'AT' THEN 'Austria'
      WHEN ${market} = 'MT' THEN 'Malta'
      WHEN ${market} = 'SO' THEN 'Somalia'
      WHEN ${market} = 'RO' THEN 'Romania'
      WHEN ${market} = 'KW' THEN 'Kuwait'
      WHEN ${market} = 'VE' THEN 'Venezuela'
      WHEN ${market} = 'CM' THEN 'Cameroon'
      WHEN ${market} = 'MH' THEN 'Marshall Islands'
      WHEN ${market} = 'AP' THEN 'Hong Kong SAR China'
      WHEN ${market} = 'BO' THEN 'Bolivia'
      WHEN ${market} = 'EH' THEN 'Western Sahara'
      WHEN ${market} = 'NR' THEN 'Nauru'
      WHEN ${market} = 'MM' THEN 'Myanmar'
      WHEN ${market} = 'BG' THEN 'Bulgaria'
      WHEN ${market} = 'VU' THEN 'Vanuatu'
      WHEN ${market} = 'EE' THEN 'Estonia'
      WHEN ${market} = 'AI' THEN 'Anguilla'
      WHEN ${market} = 'SX' THEN 'Sint Maarten'
      WHEN ${market} = 'FR' THEN 'France'
      WHEN ${market} = 'AM' THEN 'Armenia'
      WHEN ${market} = 'AZ' THEN 'Azerbaijan'
      WHEN ${market} = 'PH' THEN 'Philippines'
      WHEN ${market} = 'HR' THEN 'Croatia'
      WHEN ${market} = 'LU' THEN 'Luxembourg'
      WHEN ${market} = 'NG' THEN 'Nigeria'
      WHEN ${market} = 'KM' THEN 'Comoros'
      WHEN ${market} = 'LK' THEN 'Sri Lanka'
      WHEN ${market} = 'DK' THEN 'Denmark'
      WHEN ${market} = 'LV' THEN 'Latvia'
      WHEN ${market} = 'CO' THEN 'Colombia'
      WHEN ${market} = 'RU' THEN 'Russia'
      WHEN ${market} = 'RS' THEN 'Serbia'
      WHEN ${market} = 'ZM' THEN 'Zambia'
      WHEN ${market} = 'KI' THEN 'Kiribati'
      WHEN ${market} = 'AG' THEN 'Antigua and Barbuda'
      WHEN ${market} = 'CL' THEN 'Chile'
      WHEN ${market} = 'ID' THEN 'Indonesia'
      WHEN ${market} = 'MS' THEN 'Montserrat'
      WHEN ${market} = 'MW' THEN 'Malawi'
      WHEN ${market} = 'IN' THEN 'India'
      WHEN ${market} = 'PE' THEN 'Peru'
      WHEN ${market} = 'DZ' THEN 'Algeria'
      WHEN ${market} = 'NA' THEN 'Namibia'
      WHEN ${market} = 'BN' THEN 'Brunei'
      WHEN ${market} = 'CD' THEN 'Democratic Republic of the Congo'
      WHEN ${market} = 'MX' THEN 'Mexico'
      WHEN ${market} = 'AE' THEN 'United Arab Emirates'
      WHEN ${market} = 'BY' THEN 'Belarus'
      WHEN ${market} = 'DM' THEN 'Dominica'
      WHEN ${market} = 'SY' THEN 'Syria'
      WHEN ${market} = 'EU' THEN 'European Union'
      WHEN ${market} = 'GU' THEN 'Guam'
      WHEN ${market} = 'QA' THEN 'Qatar'
      WHEN ${market} = 'BB' THEN 'Barbados'
      WHEN ${market} = 'SB' THEN 'Solomon Islands'
      WHEN ${market} = 'GR' THEN 'Greece'
      WHEN ${market} = 'JO' THEN 'Jordan'
      WHEN ${market} = 'FK' THEN 'Falkland Islands'
      WHEN ${market} = 'AW' THEN 'Aruba'
      WHEN ${market} = 'LI' THEN 'Liechtenstein'
      WHEN ${market} = 'NE' THEN 'Niger'
      WHEN ${market} = 'GS' THEN 'South Georgia and the South Sandwich Islands'
      WHEN ${market} = 'VC' THEN 'Saint Vincent and the Grenadines'
      WHEN ${market} = 'GG' THEN 'Guernsey'
      WHEN ${market} = 'DE' THEN 'Germany'
      WHEN ${market} = 'GW' THEN 'Guinea-Bissau'
      WHEN ${market} = 'SN' THEN 'Senegal'
      WHEN ${market} = 'NC' THEN 'New Caledonia'
      WHEN ${market} = 'HT' THEN 'Haiti'
      WHEN ${market} = 'PG' THEN 'Papua New Guinea'
      WHEN ${market} = 'BT' THEN 'Bhutan'
      WHEN ${market} = 'SD' THEN 'Sudan'
      WHEN ${market} = 'CR' THEN 'Costa Rica'
      WHEN ${market} = 'NL' THEN 'Netherlands'
      WHEN ${market} = 'WS' THEN 'Samoa'
      WHEN ${market} = 'AX' THEN 'Åland Islands'
      WHEN ${market} = 'TG' THEN 'Togo'
      WHEN ${market} = 'GM' THEN 'Gambia'
      WHEN ${market} = 'IL' THEN 'Israel'
      WHEN ${market} = 'NF' THEN 'Norfolk Island'
      WHEN ${market} = 'LS' THEN 'Lesotho'
      WHEN ${market} = 'PL' THEN 'Poland'
      WHEN ${market} = 'SL' THEN 'Sierra Leone'
      WHEN ${market} = 'AF' THEN 'Afghanistan'
      WHEN ${market} = 'HU' THEN 'Hungary'
      WHEN ${market} = 'KN' THEN 'Saint Kitts and Nevis'
      WHEN ${market} = 'LA' THEN 'Laos'
      WHEN ${market} = 'WF' THEN 'Wallis and Futuna'
      WHEN ${market} = 'HN' THEN 'Honduras'
      WHEN ${market} = 'TH' THEN 'Thailand'
      WHEN ${market} = 'PS' THEN 'Palestinian Territories'
      WHEN ${market} = 'MP' THEN 'Northern Mariana Islands'
      ELSE ${market}
    END ;;
  }
  dimension: sum_missed_impression {
    type: number
    sql: ${TABLE}.sum_missed_impression ;;
  }
  dimension: sum_revenue {
    type: number
    sql: ${TABLE}.sum_revenue ;;
  }
  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }
  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partition_timestamp ;;
  }

}
