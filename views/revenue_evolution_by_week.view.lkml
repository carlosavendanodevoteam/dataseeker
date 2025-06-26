# The name of this view in Looker is "Revenue Evolution By Week"
view: revenue_evolution_by_week {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `analysis-seeker.bi_dataset.REVENUE_EVOLUTION_BY_WEEK` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Bookings" in Explore.

  dimension: bookings {
    type: number
    sql: ${TABLE}.bookings ;;
  }

  dimension: cancelled {
    type: yesno
    sql: ${TABLE}.cancelled ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;  }
  measure: average_revenue {
    type: average
    sql: ${revenue} ;;  }

  dimension: week {
    type: string
    sql: ${TABLE}.week ;;
  }

  dimension: week_number {
    type: number
    sql: ${TABLE}.week ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
  }

  dimension: full_country {
    # Nueva dimensión para los nombres completos de los países
    type: string
    sql: CASE
      WHEN ${country} = 'ES' THEN ' Spain'
      WHEN ${country} = 'CN' THEN 'China'
      WHEN ${country} = 'TR' THEN 'Turkey'
      WHEN ${country} = 'SH' THEN 'Saint Helena'
      WHEN ${country} = 'TL' THEN 'East Timor'
      WHEN ${country} = 'VG' THEN 'British Virgin Islands'
      WHEN ${country} = 'TT' THEN 'Trinidad and Tobago'
      WHEN ${country} = 'KH' THEN 'Cambodia'
      WHEN ${country} = 'RE' THEN 'Reunion Island'
      WHEN ${country} = 'SK' THEN 'Slovakia'
      WHEN ${country} = 'BH' THEN 'Bahrain'
      WHEN ${country} = 'GT' THEN 'Guatemala'
      WHEN ${country} = 'FJ' THEN 'Fiji'
      WHEN ${country} = 'NZ' THEN 'New Zealand'
      WHEN ${country} = 'TC' THEN 'Turks and Caicos Islands'
      WHEN ${country} = 'FO' THEN 'Faroe Islands'
      WHEN ${country} = 'JE' THEN 'Jersey'
      WHEN ${country} = 'KZ' THEN 'Kazakhstan'
      WHEN ${country} = 'TO' THEN 'Tonga'
      WHEN ${country} = 'TV' THEN 'Tuvalu'
      WHEN ${country} = 'KE' THEN 'Kenya'
      WHEN ${country} = 'UM' THEN 'United States Minor Outlying Islands'
      WHEN ${country} = 'BR' THEN 'Brasil'
      WHEN ${country} = 'IR' THEN 'Irán'
      WHEN ${country} = 'AF' THEN 'Afghanistan'
      WHEN ${country} = 'EC' THEN 'Ecuador'
      WHEN ${country} = 'CY' THEN 'Cyprus'
      WHEN ${country} = 'SZ' THEN 'Eswatini'
      WHEN ${country} = 'FI' THEN 'Finland'
      WHEN ${country} = 'GN' THEN 'Guinea'
      WHEN ${country} = 'GY' THEN 'Guyana'
      WHEN ${country} = 'MF' THEN 'Saint Martin'
      WHEN ${country} = 'SI' THEN 'Slovenia'
      WHEN ${country} = 'AO' THEN 'Angola'
      WHEN ${country} = 'PW' THEN 'Palau'
      WHEN ${country} = 'DO' THEN 'República Dominicana'
      WHEN ${country} = 'TM' THEN 'Turkmenistán'
      WHEN ${country} = 'TN' THEN 'Tunisia'
      WHEN ${country} = 'UG' THEN 'Uganda'
      WHEN ${country} = 'BD' THEN 'Bangladesh'
      WHEN ${country} = 'FR' THEN 'France'
      WHEN ${country} = 'CZ' THEN 'República Checa'
      WHEN ${country} = 'ST' THEN 'São Tomé and Príncipe'
      WHEN ${country} = 'OM' THEN 'Omán'
      WHEN ${country} = 'ZW' THEN 'Zimbabwe'
      WHEN ${country} = 'PF' THEN 'French Polynesia'
      WHEN ${country} = 'A1' THEN 'Anonymous Proxy'
      WHEN ${country} = 'LY' THEN 'Libia'
      WHEN ${country} = 'BM' THEN 'Bermudas'
      WHEN ${country} = 'TJ' THEN 'Tajikistan'
      WHEN ${country} = 'PT' THEN 'Portugal'
      WHEN ${country} = 'CA' THEN 'Canadá'
      WHEN ${country} = 'MC' THEN 'Mónaco'
      WHEN ${country} = 'UZ' THEN 'Uzbekistán'
      WHEN ${country} = 'SR' THEN 'Surinam'
      WHEN ${country} = 'GB' THEN 'United Kingdom'
      WHEN ${country} = 'EG' THEN 'Egipto'
      WHEN ${country} = 'PM' THEN 'Saint Pierre and Miquelon'
      WHEN ${country} = 'VN' THEN 'Vietnam'
      WHEN ${country} = 'SG' THEN 'Singapore'
      WHEN ${country} = 'SJ' THEN 'Svalbard and Jan Mayen'
      WHEN ${country} = 'AQ' THEN 'Antarctica'
      WHEN ${country} = 'IS' THEN 'Iceland'
      WHEN ${country} = 'GL' THEN 'Greenland'
      WHEN ${country} = 'YT' THEN 'Mayotte'
      WHEN ${country} = 'NL' THEN 'Netherlands'
      WHEN ${country} = 'US' THEN 'United States'
      WHEN ${country} = 'CH' THEN 'Switzerland'
      WHEN ${country} = 'MZ' THEN 'Mozambique'
      WHEN ${country} = 'KR' THEN 'South Korea'
      WHEN ${country} = 'MD' THEN 'Moldova'
      WHEN ${country} = 'TZ' THEN 'Tanzania'
      WHEN ${country} = 'FM' THEN 'Micronesia'
      WHEN ${country} = 'RW' THEN 'Rwanda'
      WHEN ${country} = 'UY' THEN 'Uruguay'
      WHEN ${country} = 'BZ' THEN 'Belize'
      WHEN ${country} = 'LT' THEN 'Lithuania'
      WHEN ${country} = 'DJ' THEN 'Djibouti'
      WHEN ${country} = 'CC' THEN 'Cocos Islands'
      WHEN ${country} = 'ZA' THEN 'South Africa'
      WHEN ${country} = 'DE' THEN 'Germany'
      WHEN ${country} = 'GE' THEN 'Georgia'
      WHEN ${country} = 'AR' THEN 'Argentina'
      WHEN ${country} = 'TD' THEN 'Chad'
      WHEN ${country} = 'PT' THEN 'Portugal'
      WHEN ${country} = 'CU' THEN 'Cuba'
      WHEN ${country} = 'CG' THEN 'Congo'
      WHEN ${country} = 'BA' THEN 'Bosnia and Herzegovina'
      WHEN ${country} = 'US' THEN 'United States'
      WHEN ${country} = 'BJ' THEN 'Benin'
      WHEN ${country} = 'HK' THEN 'Hong Kong'
      WHEN ${country} = 'HM' THEN 'Heard Island and McDonald Islands'
      WHEN ${country} = 'GI' THEN 'Gibraltar'
      WHEN ${country} = 'MG' THEN 'Madagascar'
      WHEN ${country} = 'FR' THEN 'France'
      WHEN ${country} = 'MQ' THEN 'Martinique'
      WHEN ${country} = 'MA' THEN 'Morocco'
      WHEN ${country} = 'AU' THEN 'Australia'
      WHEN ${country} = 'BS' THEN 'Bahamas'
      WHEN ${country} = 'LC' THEN 'Saint Lucia'
      WHEN ${country} = 'SV' THEN 'El Salvador'
      WHEN ${country} = 'CV' THEN 'Cabo Verde'
      WHEN ${country} = 'KG' THEN 'Kyrgyzstan'
      WHEN ${country} = 'ML' THEN 'Mali'
      WHEN ${country} = 'MV' THEN 'Maldives'
      WHEN ${country} = 'BI' THEN 'Burundi'
      WHEN ${country} = 'KP' THEN 'North Korea'
      WHEN ${country} = 'GF' THEN 'French Guiana'
      WHEN ${country} = 'DK' THEN 'Denmark'
      WHEN ${country} = 'GD' THEN 'Grenada'
      WHEN ${country} = 'CF' THEN 'Central African Republic'
      WHEN ${country} = 'JM' THEN 'Jamaica'
      WHEN ${country} = 'PR' THEN 'Puerto Rico'
      WHEN ${country} = 'PY' THEN 'Paraguay'
      WHEN ${country} = 'CK' THEN 'Cook Islands'
      WHEN ${country} = 'CI' THEN 'Ivory Coast'
      WHEN ${country} = 'ME' THEN 'Montenegro'
      WHEN ${country} = 'PT' THEN 'Portugal'
      WHEN ${country} = 'JP' THEN 'Japan'
      WHEN ${country} = 'MU' THEN 'Mauritius'
      WHEN ${country} = 'IQ' THEN 'Iraq'
      WHEN ${country} = 'BE' THEN 'Belgium'
      WHEN ${country} = 'NO' THEN 'Norway'
      WHEN ${country} = 'SC' THEN 'Seychelles'
      WHEN ${country} = 'GQ' THEN 'Equatorial Guinea'
      WHEN ${country} = 'AL' THEN 'Albania'
      WHEN ${country} = 'MK' THEN 'North Macedonia'
      WHEN ${country} = 'YE' THEN 'Yemen'
      WHEN ${country} = 'GA' THEN 'Gabon'
      WHEN ${country} = 'LB' THEN 'Lebanon'
      WHEN ${country} = 'MR' THEN 'Mauritania'
      WHEN ${country} = 'SM' THEN 'San Marino'
      WHEN ${country} = 'VA' THEN 'Vatican City'
      WHEN ${country} = 'SA' THEN 'Saudi Arabia'
      WHEN ${country} = 'AN' THEN 'Netherlands Antilles'
      WHEN ${country} = 'CX' THEN 'Christmas Island'
      WHEN ${country} = 'KY' THEN 'Cayman Islands'
      WHEN ${country} = 'SE' THEN 'Sweden'
      WHEN ${country} = 'TW' THEN 'Taiwan'
      WHEN ${country} = 'NI' THEN 'Nicaragua'
      WHEN ${country} = 'UA' THEN 'Ukraine'
      WHEN ${country} = 'CA' THEN 'Canada'
      WHEN ${country} = 'ER' THEN 'Eritrea'
      WHEN ${country} = 'CW' THEN 'Curaçao'
      WHEN ${country} = 'BW' THEN 'Botswana'
      WHEN ${country} = 'GH' THEN 'Ghana'
      WHEN ${country} = 'AD' THEN 'Andorra'
      WHEN ${country} = 'MO' THEN 'Macao'
      WHEN ${country} = 'IE' THEN 'Ireland'
      WHEN ${country} = 'IT' THEN 'Italy'
      WHEN ${country} = 'PA' THEN 'Panama'
      WHEN ${country} = 'PN' THEN 'Pitcairn'
      WHEN ${country} = 'IM' THEN 'Isle of Man'
      WHEN ${country} = 'MY' THEN 'Malaysia'
      WHEN ${country} = 'MN' THEN 'Mongolia'
      WHEN ${country} = 'GP' THEN 'Guadeloupe'
      WHEN ${country} = 'LR' THEN 'Liberia'
      WHEN ${country} = 'P' THEN 'Pakistan'
      WHEN ${country} = 'MX' THEN 'Mexico'
      WHEN ${country} = 'NP' THEN 'Nepal'
      WHEN ${country} = 'ES' THEN 'Spain'
      WHEN ${country} = 'ET' THEN 'Ethiopia'
      WHEN ${country} = 'CS' THEN 'Serbia and Montenegro'
      WHEN ${country} = 'BF' THEN 'Burkina Faso'
      WHEN ${country} = 'AS' THEN 'American Samoa'
      WHEN ${country} = 'VI' THEN 'U.S. Virgin Islands'
      WHEN ${country} = 'AT' THEN 'Austria'
      WHEN ${country} = 'MT' THEN 'Malta'
      WHEN ${country} = 'SO' THEN 'Somalia'
      WHEN ${country} = 'RO' THEN 'Romania'
      WHEN ${country} = 'KW' THEN 'Kuwait'
      WHEN ${country} = 'VE' THEN 'Venezuela'
      WHEN ${country} = 'CM' THEN 'Cameroon'
      WHEN ${country} = 'MH' THEN 'Marshall Islands'
      WHEN ${country} = 'AP' THEN 'Hong Kong SAR China'
      WHEN ${country} = 'BO' THEN 'Bolivia'
      WHEN ${country} = 'EH' THEN 'Western Sahara'
      WHEN ${country} = 'NR' THEN 'Nauru'
      WHEN ${country} = 'MM' THEN 'Myanmar'
      WHEN ${country} = 'BG' THEN 'Bulgaria'
      WHEN ${country} = 'VU' THEN 'Vanuatu'
      WHEN ${country} = 'EE' THEN 'Estonia'
      WHEN ${country} = 'AI' THEN 'Anguilla'
      WHEN ${country} = 'SX' THEN 'Sint Maarten'
      WHEN ${country} = 'FR' THEN 'France'
      WHEN ${country} = 'AM' THEN 'Armenia'
      WHEN ${country} = 'AZ' THEN 'Azerbaijan'
      WHEN ${country} = 'PH' THEN 'Philippines'
      WHEN ${country} = 'HR' THEN 'Croatia'
      WHEN ${country} = 'LU' THEN 'Luxembourg'
      WHEN ${country} = 'NG' THEN 'Nigeria'
      WHEN ${country} = 'KM' THEN 'Comoros'
      WHEN ${country} = 'LK' THEN 'Sri Lanka'
      WHEN ${country} = 'DK' THEN 'Denmark'
      WHEN ${country} = 'LV' THEN 'Latvia'
      WHEN ${country} = 'CO' THEN 'Colombia'
      WHEN ${country} = 'RU' THEN 'Russia'
      WHEN ${country} = 'RS' THEN 'Serbia'
      WHEN ${country} = 'ZM' THEN 'Zambia'
      WHEN ${country} = 'KI' THEN 'Kiribati'
      WHEN ${country} = 'AG' THEN 'Antigua and Barbuda'
      WHEN ${country} = 'CL' THEN 'Chile'
      WHEN ${country} = 'ID' THEN 'Indonesia'
      WHEN ${country} = 'MS' THEN 'Montserrat'
      WHEN ${country} = 'MW' THEN 'Malawi'
      WHEN ${country} = 'IN' THEN 'India'
      WHEN ${country} = 'PE' THEN 'Peru'
      WHEN ${country} = 'DZ' THEN 'Algeria'
      WHEN ${country} = 'NA' THEN 'Namibia'
      WHEN ${country} = 'BN' THEN 'Brunei'
      WHEN ${country} = 'CD' THEN 'Democratic Republic of the Congo'
      WHEN ${country} = 'MX' THEN 'Mexico'
      WHEN ${country} = 'AE' THEN 'United Arab Emirates'
      WHEN ${country} = 'BY' THEN 'Belarus'
      WHEN ${country} = 'DM' THEN 'Dominica'
      WHEN ${country} = 'SY' THEN 'Syria'
      WHEN ${country} = 'EU' THEN 'European Union'
      WHEN ${country} = 'GU' THEN 'Guam'
      WHEN ${country} = 'QA' THEN 'Qatar'
      WHEN ${country} = 'BB' THEN 'Barbados'
      WHEN ${country} = 'SB' THEN 'Solomon Islands'
      WHEN ${country} = 'GR' THEN 'Greece'
      WHEN ${country} = 'JO' THEN 'Jordan'
      WHEN ${country} = 'FK' THEN 'Falkland Islands'
      WHEN ${country} = 'AW' THEN 'Aruba'
      WHEN ${country} = 'LI' THEN 'Liechtenstein'
      WHEN ${country} = 'NE' THEN 'Niger'
      WHEN ${country} = 'GS' THEN 'South Georgia and the South Sandwich Islands'
      WHEN ${country} = 'VC' THEN 'Saint Vincent and the Grenadines'
      WHEN ${country} = 'GG' THEN 'Guernsey'
      WHEN ${country} = 'DE' THEN 'Germany'
      WHEN ${country} = 'GW' THEN 'Guinea-Bissau'
      WHEN ${country} = 'SN' THEN 'Senegal'
      WHEN ${country} = 'NC' THEN 'New Caledonia'
      WHEN ${country} = 'HT' THEN 'Haiti'
      WHEN ${country} = 'PG' THEN 'Papua New Guinea'
      WHEN ${country} = 'BT' THEN 'Bhutan'
      WHEN ${country} = 'SD' THEN 'Sudan'
      WHEN ${country} = 'CR' THEN 'Costa Rica'
      WHEN ${country} = 'NL' THEN 'Netherlands'
      WHEN ${country} = 'WS' THEN 'Samoa'
      WHEN ${country} = 'AX' THEN 'Åland Islands'
      WHEN ${country} = 'TG' THEN 'Togo'
      WHEN ${country} = 'GM' THEN 'Gambia'
      WHEN ${country} = 'IL' THEN 'Israel'
      WHEN ${country} = 'NF' THEN 'Norfolk Island'
      WHEN ${country} = 'LS' THEN 'Lesotho'
      WHEN ${country} = 'PL' THEN 'Poland'
      WHEN ${country} = 'SL' THEN 'Sierra Leone'
      WHEN ${country} = 'AF' THEN 'Afghanistan'
      WHEN ${country} = 'HU' THEN 'Hungary'
      WHEN ${country} = 'KN' THEN 'Saint Kitts and Nevis'
      WHEN ${country} = 'LA' THEN 'Laos'
      WHEN ${country} = 'WF' THEN 'Wallis and Futuna'
      WHEN ${country} = 'HN' THEN 'Honduras'
      WHEN ${country} = 'TH' THEN 'Thailand'
      WHEN ${country} = 'PS' THEN 'Palestinian Territories'
      WHEN ${country} = 'MP' THEN 'Northern Mariana Islands'
      ELSE ${country}
    END ;;
  }
}
