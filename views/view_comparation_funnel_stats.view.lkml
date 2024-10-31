# The name of this view in Looker is "View Comparation Funnel Stats"
view: view_comparation_funnel_stats {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `bi_dataset.VIEW_COMPARATION_FUNNEL_STATS` ;;

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
    sql: ${b1_to_b2} ;;  }
  measure: average_b1_to_b2 {
    type: average
    sql: ${b1_to_b2} ;;  }

  dimension: b1_unique_ips_to_b2 {
    type: number
    sql: ${TABLE}.b1_unique_ips_to_b2 ;;
  }

  dimension: b2_to_b3 {
    type: number
    sql: ${TABLE}.b2_to_b3 ;;
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

  dimension: booking4 {
    type: number
    sql: ${TABLE}.booking4 ;;
  }

  dimension: booking4_gateway {
    type: number
    sql: ${TABLE}.booking4_gateway ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: last_year_booking {
    type: number
    sql: ${TABLE}.last_year_booking ;;
  }

  dimension_group: partition_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.partitionTimestamp ;;
  }

  dimension: visitas {
    type: number
    sql: ${TABLE}.visitas ;;
  }
  measure: count {
    type: count
  }

  dimension_group: comparation_partitiontimestamp_without_future{
    type: time
    sql: IF(${TABLE}.last_year_booking = 0, ${TABLE}.partitionTimestamp,
      CASE
        WHEN CAST(${TABLE}.partitionTimestamp AS timestamp) > CURRENT_TIMESTAMP() THEN NULL
        ELSE CAST(${TABLE}.partitionTimestamp AS timestamp)
      END);;
    timeframes: [raw, time, date, week, month, quarter, year]
  }

  dimension: full_country {
    # Nueva dimensión para los nombres completos de los países
    type: string
    sql: CASE
      WHEN UPPER(${country}) = 'ES' THEN ' Spain'
      WHEN UPPER(${country}) = 'CN' THEN 'China'
      WHEN UPPER(${country}) = 'TR' THEN 'Turkey'
      WHEN UPPER(${country}) = 'SH' THEN 'Saint Helena'
      WHEN UPPER(${country}) = 'TL' THEN 'East Timor'
      WHEN UPPER(${country}) = 'VG' THEN 'British Virgin Islands'
      WHEN UPPER(${country}) = 'TT' THEN 'Trinidad and Tobago'
      WHEN UPPER(${country}) = 'KH' THEN 'Cambodia'
      WHEN UPPER(${country}) = 'RE' THEN 'Reunion Island'
      WHEN UPPER(${country}) = 'SK' THEN 'Slovakia'
      WHEN UPPER(${country}) = 'BH' THEN 'Bahrain'
      WHEN UPPER(${country}) = 'GT' THEN 'Guatemala'
      WHEN UPPER(${country}) = 'FJ' THEN 'Fiji'
      WHEN UPPER(${country}) = 'NZ' THEN 'New Zealand'
      WHEN UPPER(${country}) = 'TC' THEN 'Turks and Caicos Islands'
      WHEN UPPER(${country}) = 'FO' THEN 'Faroe Islands'
      WHEN UPPER(${country}) = 'JE' THEN 'Jersey'
      WHEN UPPER(${country}) = 'KZ' THEN 'Kazakhstan'
      WHEN UPPER(${country}) = 'TO' THEN 'Tonga'
      WHEN UPPER(${country}) = 'TV' THEN 'Tuvalu'
      WHEN UPPER(${country}) = 'KE' THEN 'Kenya'
      WHEN UPPER(${country}) = 'UM' THEN 'United States Minor Outlying Islands'
      WHEN UPPER(${country}) = 'BR' THEN 'Brasil'
      WHEN UPPER(${country}) = 'IR' THEN 'Irán'
      WHEN UPPER(${country}) = 'AF' THEN 'Afghanistan'
      WHEN UPPER(${country}) = 'EC' THEN 'Ecuador'
      WHEN UPPER(${country}) = 'CY' THEN 'Cyprus'
      WHEN UPPER(${country}) = 'SZ' THEN 'Eswatini'
      WHEN UPPER(${country}) = 'FI' THEN 'Finland'
      WHEN UPPER(${country}) = 'GN' THEN 'Guinea'
      WHEN UPPER(${country}) = 'GY' THEN 'Guyana'
      WHEN UPPER(${country}) = 'MF' THEN 'Saint Martin'
      WHEN UPPER(${country}) = 'SI' THEN 'Slovenia'
      WHEN UPPER(${country}) = 'AO' THEN 'Angola'
      WHEN UPPER(${country}) = 'PW' THEN 'Palau'
      WHEN UPPER(${country}) = 'DO' THEN 'República Dominicana'
      WHEN UPPER(${country}) = 'TM' THEN 'Turkmenistán'
      WHEN UPPER(${country}) = 'TN' THEN 'Tunisia'
      WHEN UPPER(${country}) = 'UG' THEN 'Uganda'
      WHEN UPPER(${country}) = 'BD' THEN 'Bangladesh'
      WHEN UPPER(${country}) = 'FR' THEN 'France'
      WHEN UPPER(${country}) = 'CZ' THEN 'República Checa'
      WHEN UPPER(${country}) = 'ST' THEN 'São Tomé and Príncipe'
      WHEN UPPER(${country}) = 'OM' THEN 'Omán'
      WHEN UPPER(${country}) = 'ZW' THEN 'Zimbabwe'
      WHEN UPPER(${country}) = 'PF' THEN 'French Polynesia'
      WHEN UPPER(${country}) = 'A1' THEN 'Anonymous Proxy'
      WHEN UPPER(${country}) = 'LY' THEN 'Libia'
      WHEN UPPER(${country}) = 'BM' THEN 'Bermudas'
      WHEN UPPER(${country}) = 'TJ' THEN 'Tajikistan'
      WHEN UPPER(${country}) = 'PT' THEN 'Portugal'
      WHEN UPPER(${country}) = 'CA' THEN 'Canadá'
      WHEN UPPER(${country}) = 'MC' THEN 'Mónaco'
      WHEN UPPER(${country}) = 'UZ' THEN 'Uzbekistán'
      WHEN UPPER(${country}) = 'SR' THEN 'Surinam'
      WHEN UPPER(${country}) = 'GB' THEN 'United Kingdom'
      WHEN UPPER(${country}) = 'EG' THEN 'Egipto'
      WHEN UPPER(${country}) = 'PM' THEN 'Saint Pierre and Miquelon'
      WHEN UPPER(${country}) = 'VN' THEN 'Vietnam'
      WHEN UPPER(${country}) = 'SG' THEN 'Singapore'
      WHEN UPPER(${country}) = 'SJ' THEN 'Svalbard and Jan Mayen'
      WHEN UPPER(${country}) = 'AQ' THEN 'Antarctica'
      WHEN UPPER(${country}) = 'IS' THEN 'Iceland'
      WHEN UPPER(${country}) = 'GL' THEN 'Greenland'
      WHEN UPPER(${country}) = 'YT' THEN 'Mayotte'
      WHEN UPPER(${country}) = 'NL' THEN 'Netherlands'
      WHEN UPPER(${country}) = 'US' THEN 'United States'
      WHEN UPPER(${country}) = 'CH' THEN 'Switzerland'
      WHEN UPPER(${country}) = 'MZ' THEN 'Mozambique'
      WHEN UPPER(${country}) = 'KR' THEN 'South Korea'
      WHEN UPPER(${country}) = 'MD' THEN 'Moldova'
      WHEN UPPER(${country}) = 'TZ' THEN 'Tanzania'
      WHEN UPPER(${country}) = 'FM' THEN 'Micronesia'
      WHEN UPPER(${country}) = 'RW' THEN 'Rwanda'
      WHEN UPPER(${country}) = 'UY' THEN 'Uruguay'
      WHEN UPPER(${country}) = 'BZ' THEN 'Belize'
      WHEN UPPER(${country}) = 'LT' THEN 'Lithuania'
      WHEN UPPER(${country}) = 'DJ' THEN 'Djibouti'
      WHEN UPPER(${country}) = 'CC' THEN 'Cocos Islands'
      WHEN UPPER(${country}) = 'ZA' THEN 'South Africa'
      WHEN UPPER(${country}) = 'DE' THEN 'Germany'
      WHEN UPPER(${country}) = 'GE' THEN 'Georgia'
      WHEN UPPER(${country}) = 'AR' THEN 'Argentina'
      WHEN UPPER(${country}) = 'TD' THEN 'Chad'
      WHEN UPPER(${country}) = 'PT' THEN 'Portugal'
      WHEN UPPER(${country}) = 'CU' THEN 'Cuba'
      WHEN UPPER(${country}) = 'CG' THEN 'Congo'
      WHEN UPPER(${country}) = 'BA' THEN 'Bosnia and Herzegovina'
      WHEN UPPER(${country}) = 'US' THEN 'United States'
      WHEN UPPER(${country}) = 'BJ' THEN 'Benin'
      WHEN UPPER(${country}) = 'HK' THEN 'Hong Kong'
      WHEN UPPER(${country}) = 'HM' THEN 'Heard Island and McDonald Islands'
      WHEN UPPER(${country}) = 'GI' THEN 'Gibraltar'
      WHEN UPPER(${country}) = 'MG' THEN 'Madagascar'
      WHEN UPPER(${country}) = 'FR' THEN 'France'
      WHEN UPPER(${country}) = 'MQ' THEN 'Martinique'
      WHEN UPPER(${country}) = 'MA' THEN 'Morocco'
      WHEN UPPER(${country}) = 'AU' THEN 'Australia'
      WHEN UPPER(${country}) = 'BS' THEN 'Bahamas'
      WHEN UPPER(${country}) = 'LC' THEN 'Saint Lucia'
      WHEN UPPER(${country}) = 'SV' THEN 'El Salvador'
      WHEN UPPER(${country}) = 'CV' THEN 'Cabo Verde'
      WHEN UPPER(${country}) = 'KG' THEN 'Kyrgyzstan'
      WHEN UPPER(${country}) = 'ML' THEN 'Mali'
      WHEN UPPER(${country}) = 'MV' THEN 'Maldives'
      WHEN UPPER(${country}) = 'BI' THEN 'Burundi'
      WHEN UPPER(${country}) = 'KP' THEN 'North Korea'
      WHEN UPPER(${country}) = 'GF' THEN 'French Guiana'
      WHEN UPPER(${country}) = 'DK' THEN 'Denmark'
      WHEN UPPER(${country}) = 'GD' THEN 'Grenada'
      WHEN UPPER(${country}) = 'CF' THEN 'Central African Republic'
      WHEN UPPER(${country}) = 'JM' THEN 'Jamaica'
      WHEN UPPER(${country}) = 'PR' THEN 'Puerto Rico'
      WHEN UPPER(${country}) = 'PY' THEN 'Paraguay'
      WHEN UPPER(${country}) = 'CK' THEN 'Cook Islands'
      WHEN UPPER(${country}) = 'CI' THEN 'Ivory Coast'
      WHEN UPPER(${country}) = 'ME' THEN 'Montenegro'
      WHEN UPPER(${country}) = 'PT' THEN 'Portugal'
      WHEN UPPER(${country}) = 'JP' THEN 'Japan'
      WHEN UPPER(${country}) = 'MU' THEN 'Mauritius'
      WHEN UPPER(${country}) = 'IQ' THEN 'Iraq'
      WHEN UPPER(${country}) = 'BE' THEN 'Belgium'
      WHEN UPPER(${country}) = 'NO' THEN 'Norway'
      WHEN UPPER(${country}) = 'SC' THEN 'Seychelles'
      WHEN UPPER(${country}) = 'GQ' THEN 'Equatorial Guinea'
      WHEN UPPER(${country}) = 'AL' THEN 'Albania'
      WHEN UPPER(${country}) = 'MK' THEN 'North Macedonia'
      WHEN UPPER(${country}) = 'YE' THEN 'Yemen'
      WHEN UPPER(${country}) = 'GA' THEN 'Gabon'
      WHEN UPPER(${country}) = 'LB' THEN 'Lebanon'
      WHEN UPPER(${country}) = 'MR' THEN 'Mauritania'
      WHEN UPPER(${country}) = 'SM' THEN 'San Marino'
      WHEN UPPER(${country}) = 'VA' THEN 'Vatican City'
      WHEN UPPER(${country}) = 'SA' THEN 'Saudi Arabia'
      WHEN UPPER(${country}) = 'AN' THEN 'Netherlands Antilles'
      WHEN UPPER(${country}) = 'CX' THEN 'Christmas Island'
      WHEN UPPER(${country}) = 'KY' THEN 'Cayman Islands'
      WHEN UPPER(${country}) = 'SE' THEN 'Sweden'
      WHEN UPPER(${country}) = 'TW' THEN 'Taiwan'
      WHEN UPPER(${country}) = 'NI' THEN 'Nicaragua'
      WHEN UPPER(${country}) = 'UA' THEN 'Ukraine'
      WHEN UPPER(${country}) = 'CA' THEN 'Canada'
      WHEN UPPER(${country}) = 'ER' THEN 'Eritrea'
      WHEN UPPER(${country}) = 'CW' THEN 'Curaçao'
      WHEN UPPER(${country}) = 'BW' THEN 'Botswana'
      WHEN UPPER(${country}) = 'GH' THEN 'Ghana'
      WHEN UPPER(${country}) = 'AD' THEN 'Andorra'
      WHEN UPPER(${country}) = 'MO' THEN 'Macao'
      WHEN UPPER(${country}) = 'IE' THEN 'Ireland'
      WHEN UPPER(${country}) = 'IT' THEN 'Italy'
      WHEN UPPER(${country}) = 'PA' THEN 'Panama'
      WHEN UPPER(${country}) = 'PN' THEN 'Pitcairn'
      WHEN UPPER(${country}) = 'IM' THEN 'Isle of Man'
      WHEN UPPER(${country}) = 'MY' THEN 'Malaysia'
      WHEN UPPER(${country}) = 'MN' THEN 'Mongolia'
      WHEN UPPER(${country}) = 'GP' THEN 'Guadeloupe'
      WHEN UPPER(${country}) = 'LR' THEN 'Liberia'
      WHEN UPPER(${country}) = 'P' THEN 'Pakistan'
      WHEN UPPER(${country}) = 'MX' THEN 'Mexico'
      WHEN UPPER(${country}) = 'NP' THEN 'Nepal'
      WHEN UPPER(${country}) = 'ES' THEN 'Spain'
      WHEN UPPER(${country}) = 'ET' THEN 'Ethiopia'
      WHEN UPPER(${country}) = 'CS' THEN 'Serbia and Montenegro'
      WHEN UPPER(${country}) = 'BF' THEN 'Burkina Faso'
      WHEN UPPER(${country}) = 'AS' THEN 'American Samoa'
      WHEN UPPER(${country}) = 'VI' THEN 'U.S. Virgin Islands'
      WHEN UPPER(${country}) = 'AT' THEN 'Austria'
      WHEN UPPER(${country}) = 'MT' THEN 'Malta'
      WHEN UPPER(${country}) = 'SO' THEN 'Somalia'
      WHEN UPPER(${country}) = 'RO' THEN 'Romania'
      WHEN UPPER(${country}) = 'KW' THEN 'Kuwait'
      WHEN UPPER(${country}) = 'VE' THEN 'Venezuela'
      WHEN UPPER(${country}) = 'CM' THEN 'Cameroon'
      WHEN UPPER(${country}) = 'MH' THEN 'Marshall Islands'
      WHEN UPPER(${country}) = 'AP' THEN 'Hong Kong SAR China'
      WHEN UPPER(${country}) = 'BO' THEN 'Bolivia'
      WHEN UPPER(${country}) = 'EH' THEN 'Western Sahara'
      WHEN UPPER(${country}) = 'NR' THEN 'Nauru'
      WHEN UPPER(${country}) = 'MM' THEN 'Myanmar'
      WHEN UPPER(${country}) = 'BG' THEN 'Bulgaria'
      WHEN UPPER(${country}) = 'VU' THEN 'Vanuatu'
      WHEN UPPER(${country}) = 'EE' THEN 'Estonia'
      WHEN UPPER(${country}) = 'AI' THEN 'Anguilla'
      WHEN UPPER(${country}) = 'SX' THEN 'Sint Maarten'
      WHEN UPPER(${country}) = 'FR' THEN 'France'
      WHEN UPPER(${country}) = 'AM' THEN 'Armenia'
      WHEN UPPER(${country}) = 'AZ' THEN 'Azerbaijan'
      WHEN UPPER(${country}) = 'PH' THEN 'Philippines'
      WHEN UPPER(${country}) = 'HR' THEN 'Croatia'
      WHEN UPPER(${country}) = 'LU' THEN 'Luxembourg'
      WHEN UPPER(${country}) = 'NG' THEN 'Nigeria'
      WHEN UPPER(${country}) = 'KM' THEN 'Comoros'
      WHEN UPPER(${country}) = 'LK' THEN 'Sri Lanka'
      WHEN UPPER(${country}) = 'DK' THEN 'Denmark'
      WHEN UPPER(${country}) = 'LV' THEN 'Latvia'
      WHEN UPPER(${country}) = 'CO' THEN 'Colombia'
      WHEN UPPER(${country}) = 'RU' THEN 'Russia'
      WHEN UPPER(${country}) = 'RS' THEN 'Serbia'
      WHEN UPPER(${country}) = 'ZM' THEN 'Zambia'
      WHEN UPPER(${country}) = 'KI' THEN 'Kiribati'
      WHEN UPPER(${country}) = 'AG' THEN 'Antigua and Barbuda'
      WHEN UPPER(${country}) = 'CL' THEN 'Chile'
      WHEN UPPER(${country}) = 'ID' THEN 'Indonesia'
      WHEN UPPER(${country}) = 'MS' THEN 'Montserrat'
      WHEN UPPER(${country}) = 'MW' THEN 'Malawi'
      WHEN UPPER(${country}) = 'IN' THEN 'India'
      WHEN UPPER(${country}) = 'PE' THEN 'Peru'
      WHEN UPPER(${country}) = 'DZ' THEN 'Algeria'
      WHEN UPPER(${country}) = 'NA' THEN 'Namibia'
      WHEN UPPER(${country}) = 'BN' THEN 'Brunei'
      WHEN UPPER(${country}) = 'CD' THEN 'Democratic Republic of the Congo'
      WHEN UPPER(${country}) = 'MX' THEN 'Mexico'
      WHEN UPPER(${country}) = 'AE' THEN 'United Arab Emirates'
      WHEN UPPER(${country}) = 'BY' THEN 'Belarus'
      WHEN UPPER(${country}) = 'DM' THEN 'Dominica'
      WHEN UPPER(${country}) = 'SY' THEN 'Syria'
      WHEN UPPER(${country}) = 'EU' THEN 'European Union'
      WHEN UPPER(${country}) = 'GU' THEN 'Guam'
      WHEN UPPER(${country}) = 'QA' THEN 'Qatar'
      WHEN UPPER(${country}) = 'BB' THEN 'Barbados'
      WHEN UPPER(${country}) = 'SB' THEN 'Solomon Islands'
      WHEN UPPER(${country}) = 'GR' THEN 'Greece'
      WHEN UPPER(${country}) = 'JO' THEN 'Jordan'
      WHEN UPPER(${country}) = 'FK' THEN 'Falkland Islands'
      WHEN UPPER(${country}) = 'AW' THEN 'Aruba'
      WHEN UPPER(${country}) = 'LI' THEN 'Liechtenstein'
      WHEN UPPER(${country}) = 'NE' THEN 'Niger'
      WHEN UPPER(${country}) = 'GS' THEN 'South Georgia and the South Sandwich Islands'
      WHEN UPPER(${country}) = 'VC' THEN 'Saint Vincent and the Grenadines'
      WHEN UPPER(${country}) = 'GG' THEN 'Guernsey'
      WHEN UPPER(${country}) = 'DE' THEN 'Germany'
      WHEN UPPER(${country}) = 'GW' THEN 'Guinea-Bissau'
      WHEN UPPER(${country}) = 'SN' THEN 'Senegal'
      WHEN UPPER(${country}) = 'NC' THEN 'New Caledonia'
      WHEN UPPER(${country}) = 'HT' THEN 'Haiti'
      WHEN UPPER(${country}) = 'PG' THEN 'Papua New Guinea'
      WHEN UPPER(${country}) = 'BT' THEN 'Bhutan'
      WHEN UPPER(${country}) = 'SD' THEN 'Sudan'
      WHEN UPPER(${country}) = 'CR' THEN 'Costa Rica'
      WHEN UPPER(${country}) = 'NL' THEN 'Netherlands'
      WHEN UPPER(${country}) = 'WS' THEN 'Samoa'
      WHEN UPPER(${country}) = 'AX' THEN 'Åland Islands'
      WHEN UPPER(${country}) = 'TG' THEN 'Togo'
      WHEN UPPER(${country}) = 'GM' THEN 'Gambia'
      WHEN UPPER(${country}) = 'IL' THEN 'Israel'
      WHEN UPPER(${country}) = 'NF' THEN 'Norfolk Island'
      WHEN UPPER(${country}) = 'LS' THEN 'Lesotho'
      WHEN UPPER(${country}) = 'PL' THEN 'Poland'
      WHEN UPPER(${country}) = 'SL' THEN 'Sierra Leone'
      WHEN UPPER(${country}) = 'AF' THEN 'Afghanistan'
      WHEN UPPER(${country}) = 'HU' THEN 'Hungary'
      WHEN UPPER(${country}) = 'KN' THEN 'Saint Kitts and Nevis'
      WHEN UPPER(${country}) = 'LA' THEN 'Laos'
      WHEN UPPER(${country}) = 'WF' THEN 'Wallis and Futuna'
      WHEN UPPER(${country}) = 'HN' THEN 'Honduras'
      WHEN UPPER(${country}) = 'TH' THEN 'Thailand'
      WHEN UPPER(${country}) = 'PS' THEN 'Palestinian Territories'
      WHEN UPPER(${country}) = 'MP' THEN 'Northern Mariana Islands'
      ELSE UPPER(${country})
    END ;;
  }

}
