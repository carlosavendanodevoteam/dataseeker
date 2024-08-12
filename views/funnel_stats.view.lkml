# The name of this view in Looker is "Funnel Stats"
view: funnel_stats {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.FUNNEL_STATS` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "B1 to B2" in Explore.

  dimension: b1_to_b2 {
    type: number
    sql: ${TABLE}.b1_to_b2 ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_b1_to_b2 {
    type: sum
    sql: ${b1_to_b2} ;;
  }

  measure: average_b1_to_b2 {
    type: average
    sql: ${b1_to_b2} ;;
  }

  dimension: b1_unique_ips_to_b2 {
    type: number
    sql: ${TABLE}.b1_unique_ips_to_b2 ;;
  }

  dimension: b2_to_b3 {
    type: number
    sql: ${TABLE}.b2_to_b3 ;;
  }

  measure: average_b2_to_b3 {
    type: average
    sql: ${b2_to_b3} ;;
  }

  dimension: booking1 {
    type: number
    sql: ${TABLE}.booking1 ;;
  }

  dimension: booking1_unique_ips {
    type: number
    sql: ${TABLE}.booking1_unique_ips ;;
  }

  dimension: booking2 {
    type: number
    sql: ${TABLE}.booking2 ;;
  }

  dimension: booking3 {
    type: number
    sql: ${TABLE}.booking3 ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: hotel_code {
    type: string
    sql: ${TABLE}.hotel_code ;;
  }

  dimension: visitas {
    type: number
    sql: ${TABLE}.visitas ;;
  }

  measure: count {
    type: count
  }

  dimension: booking4 {
    type: number
    sql: ${TABLE}.booking4 ;;
  }

  dimension: booking4_gateway {
    type: number
    sql: ${TABLE}.booking4_gateway ;;
  }

  dimension: full_country {
    # Nueva dimensión para los nombres completos de los países
    type: string
    sql: CASE
    WHEN UPPER(${TABLE}.country) = 'ES' THEN ' Spain'
    WHEN UPPER(${TABLE}.country) = 'CN' THEN 'China'
    WHEN UPPER(${TABLE}.country) = 'TR' THEN 'Turkey'
    WHEN UPPER(${TABLE}.country) = 'SH' THEN 'Saint Helena'
    WHEN UPPER(${TABLE}.country) = 'TL' THEN 'East Timor'
    WHEN UPPER(${TABLE}.country) = 'VG' THEN 'British Virgin Islands'
    WHEN UPPER(${TABLE}.country) = 'TT' THEN 'Trinidad and Tobago'
    WHEN UPPER(${TABLE}.country) = 'KH' THEN 'Cambodia'
    WHEN UPPER(${TABLE}.country) = 'RE' THEN 'Reunion Island'
    WHEN UPPER(${TABLE}.country) = 'SK' THEN 'Slovakia'
    WHEN UPPER(${TABLE}.country) = 'BH' THEN 'Bahrain'
    WHEN UPPER(${TABLE}.country) = 'GT' THEN 'Guatemala'
    WHEN UPPER(${TABLE}.country) = 'FJ' THEN 'Fiji'
    WHEN UPPER(${TABLE}.country) = 'NZ' THEN 'New Zealand'
    WHEN UPPER(${TABLE}.country) = 'TC' THEN 'Turks and Caicos Islands'
    WHEN UPPER(${TABLE}.country) = 'FO' THEN 'Faroe Islands'
    WHEN UPPER(${TABLE}.country) = 'JE' THEN 'Jersey'
    WHEN UPPER(${TABLE}.country) = 'KZ' THEN 'Kazakhstan'
    WHEN UPPER(${TABLE}.country) = 'TO' THEN 'Tonga'
    WHEN UPPER(${TABLE}.country) = 'TV' THEN 'Tuvalu'
    WHEN UPPER(${TABLE}.country) = 'KE' THEN 'Kenya'
    WHEN UPPER(${TABLE}.country) = 'UM' THEN 'United States Minor Outlying Islands'
    WHEN UPPER(${TABLE}.country) = 'BR' THEN 'Brasil'
    WHEN UPPER(${TABLE}.country) = 'IR' THEN 'Irán'
    WHEN UPPER(${TABLE}.country) = 'AF' THEN 'Afghanistan'
    WHEN UPPER(${TABLE}.country) = 'EC' THEN 'Ecuador'
    WHEN UPPER(${TABLE}.country) = 'CY' THEN 'Cyprus'
    WHEN UPPER(${TABLE}.country) = 'SZ' THEN 'Eswatini'
    WHEN UPPER(${TABLE}.country) = 'FI' THEN 'Finland'
    WHEN UPPER(${TABLE}.country) = 'GN' THEN 'Guinea'
    WHEN UPPER(${TABLE}.country) = 'GY' THEN 'Guyana'
    WHEN UPPER(${TABLE}.country) = 'MF' THEN 'Saint Martin'
    WHEN UPPER(${TABLE}.country) = 'SI' THEN 'Slovenia'
    WHEN UPPER(${TABLE}.country) = 'AO' THEN 'Angola'
    WHEN UPPER(${TABLE}.country) = 'PW' THEN 'Palau'
    WHEN UPPER(${TABLE}.country) = 'DO' THEN 'República Dominicana'
    WHEN UPPER(${TABLE}.country) = 'TM' THEN 'Turkmenistán'
    WHEN UPPER(${TABLE}.country) = 'TN' THEN 'Tunisia'
    WHEN UPPER(${TABLE}.country) = 'UG' THEN 'Uganda'
    WHEN UPPER(${TABLE}.country) = 'BD' THEN 'Bangladesh'
    WHEN UPPER(${TABLE}.country) = 'FR' THEN 'France'
    WHEN UPPER(${TABLE}.country) = 'CZ' THEN 'República Checa'
    WHEN UPPER(${TABLE}.country) = 'ST' THEN 'São Tomé and Príncipe'
    WHEN UPPER(${TABLE}.country) = 'OM' THEN 'Omán'
    WHEN UPPER(${TABLE}.country) = 'ZW' THEN 'Zimbabwe'
    WHEN UPPER(${TABLE}.country) = 'PF' THEN 'French Polynesia'
    WHEN UPPER(${TABLE}.country) = 'A1' THEN 'Anonymous Proxy'
    WHEN UPPER(${TABLE}.country) = 'LY' THEN 'Libia'
    WHEN UPPER(${TABLE}.country) = 'BM' THEN 'Bermudas'
    WHEN UPPER(${TABLE}.country) = 'TJ' THEN 'Tajikistan'
    WHEN UPPER(${TABLE}.country) = 'PT' THEN 'Portugal'
    WHEN UPPER(${TABLE}.country) = 'CA' THEN 'Canadá'
    WHEN UPPER(${TABLE}.country) = 'MC' THEN 'Mónaco'
    WHEN UPPER(${TABLE}.country) = 'UZ' THEN 'Uzbekistán'
    WHEN UPPER(${TABLE}.country) = 'SR' THEN 'Surinam'
    WHEN UPPER(${TABLE}.country) = 'GB' THEN 'United Kingdom'
    WHEN UPPER(${TABLE}.country) = 'EG' THEN 'Egipto'
    WHEN UPPER(${TABLE}.country) = 'PM' THEN 'Saint Pierre and Miquelon'
    WHEN UPPER(${TABLE}.country) = 'VN' THEN 'Vietnam'
    WHEN UPPER(${TABLE}.country) = 'SG' THEN 'Singapore'
    WHEN UPPER(${TABLE}.country) = 'SJ' THEN 'Svalbard and Jan Mayen'
    WHEN UPPER(${TABLE}.country) = 'AQ' THEN 'Antarctica'
    WHEN UPPER(${TABLE}.country) = 'IS' THEN 'Iceland'
    WHEN UPPER(${TABLE}.country) = 'GL' THEN 'Greenland'
    WHEN UPPER(${TABLE}.country) = 'YT' THEN 'Mayotte'
    WHEN UPPER(${TABLE}.country) = 'NL' THEN 'Netherlands'
    WHEN UPPER(${TABLE}.country) = 'US' THEN 'United States'
    WHEN UPPER(${TABLE}.country) = 'CH' THEN 'Switzerland'
    WHEN UPPER(${TABLE}.country) = 'MZ' THEN 'Mozambique'
    WHEN UPPER(${TABLE}.country) = 'KR' THEN 'South Korea'
    WHEN UPPER(${TABLE}.country) = 'MD' THEN 'Moldova'
    WHEN UPPER(${TABLE}.country) = 'TZ' THEN 'Tanzania'
    WHEN UPPER(${TABLE}.country) = 'FM' THEN 'Micronesia'
    WHEN UPPER(${TABLE}.country) = 'RW' THEN 'Rwanda'
    WHEN UPPER(${TABLE}.country) = 'UY' THEN 'Uruguay'
    WHEN UPPER(${TABLE}.country) = 'BZ' THEN 'Belize'
    WHEN UPPER(${TABLE}.country) = 'LT' THEN 'Lithuania'
    WHEN UPPER(${TABLE}.country) = 'DJ' THEN 'Djibouti'
    WHEN UPPER(${TABLE}.country) = 'CC' THEN 'Cocos Islands'
    WHEN UPPER(${TABLE}.country) = 'ZA' THEN 'South Africa'
    WHEN UPPER(${TABLE}.country) = 'DE' THEN 'Germany'
    WHEN UPPER(${TABLE}.country) = 'GE' THEN 'Georgia'
    WHEN UPPER(${TABLE}.country) = 'AR' THEN 'Argentina'
    WHEN UPPER(${TABLE}.country) = 'TD' THEN 'Chad'
    WHEN UPPER(${TABLE}.country) = 'PT' THEN 'Portugal'
    WHEN UPPER(${TABLE}.country) = 'CU' THEN 'Cuba'
    WHEN UPPER(${TABLE}.country) = 'CG' THEN 'Congo'
    WHEN UPPER(${TABLE}.country) = 'BA' THEN 'Bosnia and Herzegovina'
    WHEN UPPER(${TABLE}.country) = 'US' THEN 'United States'
    WHEN UPPER(${TABLE}.country) = 'BJ' THEN 'Benin'
    WHEN UPPER(${TABLE}.country) = 'HK' THEN 'Hong Kong'
    WHEN UPPER(${TABLE}.country) = 'HM' THEN 'Heard Island and McDonald Islands'
    WHEN UPPER(${TABLE}.country) = 'GI' THEN 'Gibraltar'
    WHEN UPPER(${TABLE}.country) = 'MG' THEN 'Madagascar'
    WHEN UPPER(${TABLE}.country) = 'FR' THEN 'France'
    WHEN UPPER(${TABLE}.country) = 'MQ' THEN 'Martinique'
    WHEN UPPER(${TABLE}.country) = 'MA' THEN 'Morocco'
    WHEN UPPER(${TABLE}.country) = 'AU' THEN 'Australia'
    WHEN UPPER(${TABLE}.country) = 'BS' THEN 'Bahamas'
    WHEN UPPER(${TABLE}.country) = 'LC' THEN 'Saint Lucia'
    WHEN UPPER(${TABLE}.country) = 'SV' THEN 'El Salvador'
    WHEN UPPER(${TABLE}.country) = 'CV' THEN 'Cabo Verde'
    WHEN UPPER(${TABLE}.country) = 'KG' THEN 'Kyrgyzstan'
    WHEN UPPER(${TABLE}.country) = 'ML' THEN 'Mali'
    WHEN UPPER(${TABLE}.country) = 'MV' THEN 'Maldives'
    WHEN UPPER(${TABLE}.country) = 'BI' THEN 'Burundi'
    WHEN UPPER(${TABLE}.country) = 'KP' THEN 'North Korea'
    WHEN UPPER(${TABLE}.country) = 'GF' THEN 'French Guiana'
    WHEN UPPER(${TABLE}.country) = 'DK' THEN 'Denmark'
    WHEN UPPER(${TABLE}.country) = 'GD' THEN 'Grenada'
    WHEN UPPER(${TABLE}.country) = 'CF' THEN 'Central African Republic'
    WHEN UPPER(${TABLE}.country) = 'JM' THEN 'Jamaica'
    WHEN UPPER(${TABLE}.country) = 'PR' THEN 'Puerto Rico'
    WHEN UPPER(${TABLE}.country) = 'PY' THEN 'Paraguay'
    WHEN UPPER(${TABLE}.country) = 'CK' THEN 'Cook Islands'
    WHEN UPPER(${TABLE}.country) = 'CI' THEN 'Ivory Coast'
    WHEN UPPER(${TABLE}.country) = 'ME' THEN 'Montenegro'
    WHEN UPPER(${TABLE}.country) = 'PT' THEN 'Portugal'
    WHEN UPPER(${TABLE}.country) = 'JP' THEN 'Japan'
    WHEN UPPER(${TABLE}.country) = 'MU' THEN 'Mauritius'
    WHEN UPPER(${TABLE}.country) = 'IQ' THEN 'Iraq'
    WHEN UPPER(${TABLE}.country) = 'BE' THEN 'Belgium'
    WHEN UPPER(${TABLE}.country) = 'NO' THEN 'Norway'
    WHEN UPPER(${TABLE}.country) = 'SC' THEN 'Seychelles'
    WHEN UPPER(${TABLE}.country) = 'GQ' THEN 'Equatorial Guinea'
    WHEN UPPER(${TABLE}.country) = 'AL' THEN 'Albania'
    WHEN UPPER(${TABLE}.country) = 'MK' THEN 'North Macedonia'
    WHEN UPPER(${TABLE}.country) = 'YE' THEN 'Yemen'
    WHEN UPPER(${TABLE}.country) = 'GA' THEN 'Gabon'
    WHEN UPPER(${TABLE}.country) = 'LB' THEN 'Lebanon'
    WHEN UPPER(${TABLE}.country) = 'MR' THEN 'Mauritania'
    WHEN UPPER(${TABLE}.country) = 'SM' THEN 'San Marino'
    WHEN UPPER(${TABLE}.country) = 'VA' THEN 'Vatican City'
    WHEN UPPER(${TABLE}.country) = 'SA' THEN 'Saudi Arabia'
    WHEN UPPER(${TABLE}.country) = 'AN' THEN 'Netherlands Antilles'
    WHEN UPPER(${TABLE}.country) = 'CX' THEN 'Christmas Island'
    WHEN UPPER(${TABLE}.country) = 'KY' THEN 'Cayman Islands'
    WHEN UPPER(${TABLE}.country) = 'SE' THEN 'Sweden'
    WHEN UPPER(${TABLE}.country) = 'TW' THEN 'Taiwan'
    WHEN UPPER(${TABLE}.country) = 'NI' THEN 'Nicaragua'
    WHEN UPPER(${TABLE}.country) = 'UA' THEN 'Ukraine'
    WHEN UPPER(${TABLE}.country) = 'CA' THEN 'Canada'
    WHEN UPPER(${TABLE}.country) = 'ER' THEN 'Eritrea'
    WHEN UPPER(${TABLE}.country) = 'CW' THEN 'Curaçao'
    WHEN UPPER(${TABLE}.country) = 'BW' THEN 'Botswana'
    WHEN UPPER(${TABLE}.country) = 'GH' THEN 'Ghana'
    WHEN UPPER(${TABLE}.country) = 'AD' THEN 'Andorra'
    WHEN UPPER(${TABLE}.country) = 'MO' THEN 'Macao'
    WHEN UPPER(${TABLE}.country) = 'IE' THEN 'Ireland'
    WHEN UPPER(${TABLE}.country) = 'IT' THEN 'Italy'
    WHEN UPPER(${TABLE}.country) = 'PA' THEN 'Panama'
    WHEN UPPER(${TABLE}.country) = 'PN' THEN 'Pitcairn'
    WHEN UPPER(${TABLE}.country) = 'IM' THEN 'Isle of Man'
    WHEN UPPER(${TABLE}.country) = 'MY' THEN 'Malaysia'
    WHEN UPPER(${TABLE}.country) = 'MN' THEN 'Mongolia'
    WHEN UPPER(${TABLE}.country) = 'GP' THEN 'Guadeloupe'
    WHEN UPPER(${TABLE}.country) = 'LR' THEN 'Liberia'
    WHEN UPPER(${TABLE}.country) = 'P' THEN 'Pakistan'
    WHEN UPPER(${TABLE}.country) = 'MX' THEN 'Mexico'
    WHEN UPPER(${TABLE}.country) = 'NP' THEN 'Nepal'
    WHEN UPPER(${TABLE}.country) = 'ES' THEN 'Spain'
    WHEN UPPER(${TABLE}.country) = 'ET' THEN 'Ethiopia'
    WHEN UPPER(${TABLE}.country) = 'CS' THEN 'Serbia and Montenegro'
    WHEN UPPER(${TABLE}.country) = 'BF' THEN 'Burkina Faso'
    WHEN UPPER(${TABLE}.country) = 'AS' THEN 'American Samoa'
    WHEN UPPER(${TABLE}.country) = 'VI' THEN 'U.S. Virgin Islands'
    WHEN UPPER(${TABLE}.country) = 'AT' THEN 'Austria'
    WHEN UPPER(${TABLE}.country) = 'MT' THEN 'Malta'
    WHEN UPPER(${TABLE}.country) = 'SO' THEN 'Somalia'
    WHEN UPPER(${TABLE}.country) = 'RO' THEN 'Romania'
    WHEN UPPER(${TABLE}.country) = 'KW' THEN 'Kuwait'
    WHEN UPPER(${TABLE}.country) = 'VE' THEN 'Venezuela'
    WHEN UPPER(${TABLE}.country) = 'CM' THEN 'Cameroon'
    WHEN UPPER(${TABLE}.country) = 'MH' THEN 'Marshall Islands'
    WHEN UPPER(${TABLE}.country) = 'AP' THEN 'Hong Kong SAR China'
    WHEN UPPER(${TABLE}.country) = 'BO' THEN 'Bolivia'
    WHEN UPPER(${TABLE}.country) = 'EH' THEN 'Western Sahara'
    WHEN UPPER(${TABLE}.country) = 'NR' THEN 'Nauru'
    WHEN UPPER(${TABLE}.country) = 'MM' THEN 'Myanmar'
    WHEN UPPER(${TABLE}.country) = 'BG' THEN 'Bulgaria'
    WHEN UPPER(${TABLE}.country) = 'VU' THEN 'Vanuatu'
    WHEN UPPER(${TABLE}.country) = 'EE' THEN 'Estonia'
    WHEN UPPER(${TABLE}.country) = 'AI' THEN 'Anguilla'
    WHEN UPPER(${TABLE}.country) = 'SX' THEN 'Sint Maarten'
    WHEN UPPER(${TABLE}.country) = 'FR' THEN 'France'
    WHEN UPPER(${TABLE}.country) = 'AM' THEN 'Armenia'
    WHEN UPPER(${TABLE}.country) = 'AZ' THEN 'Azerbaijan'
    WHEN UPPER(${TABLE}.country) = 'PH' THEN 'Philippines'
    WHEN UPPER(${TABLE}.country) = 'HR' THEN 'Croatia'
    WHEN UPPER(${TABLE}.country) = 'LU' THEN 'Luxembourg'
    WHEN UPPER(${TABLE}.country) = 'NG' THEN 'Nigeria'
    WHEN UPPER(${TABLE}.country) = 'KM' THEN 'Comoros'
    WHEN UPPER(${TABLE}.country) = 'LK' THEN 'Sri Lanka'
    WHEN UPPER(${TABLE}.country) = 'DK' THEN 'Denmark'
    WHEN UPPER(${TABLE}.country) = 'LV' THEN 'Latvia'
    WHEN UPPER(${TABLE}.country) = 'CO' THEN 'Colombia'
    WHEN UPPER(${TABLE}.country) = 'RU' THEN 'Russia'
    WHEN UPPER(${TABLE}.country) = 'RS' THEN 'Serbia'
    WHEN UPPER(${TABLE}.country) = 'ZM' THEN 'Zambia'
    WHEN UPPER(${TABLE}.country) = 'KI' THEN 'Kiribati'
    WHEN UPPER(${TABLE}.country) = 'AG' THEN 'Antigua and Barbuda'
    WHEN UPPER(${TABLE}.country) = 'CL' THEN 'Chile'
    WHEN UPPER(${TABLE}.country) = 'ID' THEN 'Indonesia'
    WHEN UPPER(${TABLE}.country) = 'MS' THEN 'Montserrat'
    WHEN UPPER(${TABLE}.country) = 'MW' THEN 'Malawi'
    WHEN UPPER(${TABLE}.country) = 'IN' THEN 'India'
    WHEN UPPER(${TABLE}.country) = 'PE' THEN 'Peru'
    WHEN UPPER(${TABLE}.country) = 'DZ' THEN 'Algeria'
    WHEN UPPER(${TABLE}.country) = 'NA' THEN 'Namibia'
    WHEN UPPER(${TABLE}.country) = 'BN' THEN 'Brunei'
    WHEN UPPER(${TABLE}.country) = 'CD' THEN 'Democratic Republic of the Congo'
    WHEN UPPER(${TABLE}.country) = 'MX' THEN 'Mexico'
    WHEN UPPER(${TABLE}.country) = 'AE' THEN 'United Arab Emirates'
    WHEN UPPER(${TABLE}.country) = 'BY' THEN 'Belarus'
    WHEN UPPER(${TABLE}.country) = 'DM' THEN 'Dominica'
    WHEN UPPER(${TABLE}.country) = 'SY' THEN 'Syria'
    WHEN UPPER(${TABLE}.country) = 'EU' THEN 'European Union'
    WHEN UPPER(${TABLE}.country) = 'GU' THEN 'Guam'
    WHEN UPPER(${TABLE}.country) = 'QA' THEN 'Qatar'
    WHEN UPPER(${TABLE}.country) = 'BB' THEN 'Barbados'
    WHEN UPPER(${TABLE}.country) = 'SB' THEN 'Solomon Islands'
    WHEN UPPER(${TABLE}.country) = 'GR' THEN 'Greece'
    WHEN UPPER(${TABLE}.country) = 'JO' THEN 'Jordan'
    WHEN UPPER(${TABLE}.country) = 'FK' THEN 'Falkland Islands'
    WHEN UPPER(${TABLE}.country) = 'AW' THEN 'Aruba'
    WHEN UPPER(${TABLE}.country) = 'LI' THEN 'Liechtenstein'
    WHEN UPPER(${TABLE}.country) = 'NE' THEN 'Niger'
    WHEN UPPER(${TABLE}.country) = 'GS' THEN 'South Georgia and the South Sandwich Islands'
    WHEN UPPER(${TABLE}.country) = 'VC' THEN 'Saint Vincent and the Grenadines'
    WHEN UPPER(${TABLE}.country) = 'GG' THEN 'Guernsey'
    WHEN UPPER(${TABLE}.country) = 'DE' THEN 'Germany'
    WHEN UPPER(${TABLE}.country) = 'GW' THEN 'Guinea-Bissau'
    WHEN UPPER(${TABLE}.country) = 'SN' THEN 'Senegal'
    WHEN UPPER(${TABLE}.country) = 'NC' THEN 'New Caledonia'
    WHEN UPPER(${TABLE}.country) = 'HT' THEN 'Haiti'
    WHEN UPPER(${TABLE}.country) = 'PG' THEN 'Papua New Guinea'
    WHEN UPPER(${TABLE}.country) = 'BT' THEN 'Bhutan'
    WHEN UPPER(${TABLE}.country) = 'SD' THEN 'Sudan'
    WHEN UPPER(${TABLE}.country) = 'CR' THEN 'Costa Rica'
    WHEN UPPER(${TABLE}.country) = 'NL' THEN 'Netherlands'
    WHEN UPPER(${TABLE}.country) = 'WS' THEN 'Samoa'
    WHEN UPPER(${TABLE}.country) = 'AX' THEN 'Åland Islands'
    WHEN UPPER(${TABLE}.country) = 'TG' THEN 'Togo'
    WHEN UPPER(${TABLE}.country) = 'GM' THEN 'Gambia'
    WHEN UPPER(${TABLE}.country) = 'IL' THEN 'Israel'
    WHEN UPPER(${TABLE}.country) = 'NF' THEN 'Norfolk Island'
    WHEN UPPER(${TABLE}.country) = 'LS' THEN 'Lesotho'
    WHEN UPPER(${TABLE}.country) = 'PL' THEN 'Poland'
    WHEN UPPER(${TABLE}.country) = 'SL' THEN 'Sierra Leone'
    WHEN UPPER(${TABLE}.country) = 'AF' THEN 'Afghanistan'
    WHEN UPPER(${TABLE}.country) = 'HU' THEN 'Hungary'
    WHEN UPPER(${TABLE}.country) = 'KN' THEN 'Saint Kitts and Nevis'
    WHEN UPPER(${TABLE}.country) = 'LA' THEN 'Laos'
    WHEN UPPER(${TABLE}.country) = 'WF' THEN 'Wallis and Futuna'
    WHEN UPPER(${TABLE}.country) = 'HN' THEN 'Honduras'
    WHEN UPPER(${TABLE}.country) = 'TH' THEN 'Thailand'
    WHEN UPPER(${TABLE}.country) = 'PS' THEN 'Palestinian Territories'
    WHEN UPPER(${TABLE}.country) = 'MP' THEN 'Northern Mariana Islands'
    ELSE UPPER(${TABLE}.country)
    END ;;
  }
}
