/* global moment, $ */
/* exported CrowdSec */
/* eslint no-undef: "error" */
/* eslint semi: "error" */



//  function _initStatusDecisions() {
//    const url = '/api/crowdsec/decisions/get';
//    const id = '#decisions';
//    const dataCallback = function (data) {
//      const rows = [];
//      data.map(function (row) {
//        row.decisions.map(function (decision) {
//          // ignore deleted decisions
//          if (decision.duration.startsWith('-')) {
//            return;
//          }
//          rows.push({
//            // search will break on empty values when using .append(). so we use spaces
//            delete: '',
//            id: decision.id,
//            source: decision.origin || ' ',
//            scope_value:
//              decision.scope + (decision.value ? ':' + decision.value : ''),
//            reason: decision.scenario || ' ',
//            action: decision.type || ' ',
//            country: row.source.cn || ' ',
//            as: row.source.as_name || ' ',
//            events_count: row.events_count,
//            // XXX pre-parse duration to seconds, and integer type, for sorting
//            expiration: decision.duration || ' ',
//            alert_id: row.id || ' ',
//          });
//        });
//      });
//      $(id + ' table')
//        .bootgrid('clear')
//        .bootgrid('append', rows);
//    };
//    _initTab(id, url, dataCallback);
//  }

//  function deleteDecision(decisionId) {
//    const $modal = $('#remove-decision-modal');
//    $modal.find('.modal-title').text('Delete decision #' + decisionId);
//    $modal.find('.modal-body').text('Are you sure?');
//    $modal.find('#remove-decision-confirm').on('click', function () {
//      $.ajax({
//        // XXX handle errors
//        url: '/api/crowdsec/decisions/delete/' + decisionId,
//        method: 'DELETE',
//        success: function (result) {
//          if (result && result.message === 'OK') {
//            $('#decisions table').bootgrid('remove', [decisionId]);
//            $modal.modal('hide');
//          }
//        },
//      });
//    });
//    $modal.modal('show');
//  }


const CrowdSec = (function () {
  'use strict';

  const config_dir_path = "/usr/local/etc/crowdsec/";

  function _parseDuration(duration) {
    const re = /(-?)(?:(?:(\d+)h)?(\d+)m)?(\d+).\d+(m?)s/m;
    const matches = duration.match(re);
    let seconds = 0;

    if (!matches.length) {
      throw new Error(
        'Unable to parse the following duration: ' + duration + '.',
      );
    }
    if (typeof matches[2] !== 'undefined') {
      seconds += parseInt(matches[2], 10) * 3600; // hours
    }
    if (typeof matches[3] !== 'undefined') {
      seconds += parseInt(matches[3], 10) * 60; // minutes
    }
    if (typeof matches[4] !== 'undefined') {
      seconds += parseInt(matches[4], 10); // seconds
    }
    if (parseInt(matches[5], 10) === 'm') {
      // units in milliseconds
      seconds *= 0.001;
    }
    if (parseInt(matches[1], 10) === '-') {
      // negative
      seconds = -seconds;
    }
    return seconds;
  }

  function _humanizeDate(text) {
    return moment(text).fromNow();
  }

  function _humanizeDuration(text) {
    return moment.duration(_parseDuration(text), 'seconds').humanize();
  }

  const formatters = {
    yesno: function(val) {
      if (val) {
        return '<i class="fa fa-check text-success"></i>';
      } else {
        return '<i class="fa fa-times text-danger"></i>';
      }
    },

    trimpath: function (val) {
      return val ? val.replace(config_dir_path, '') : '';
    },

    duration: function (val) {
      if (!val) {
        return 'n/a';
      }
      return $('<div>')
        .attr({
          'data-toggle': 'tooltip',
          'data-placement': 'left',
          title: val,
        })
        .text(_humanizeDuration(val))
        .prop('outerHTML');
    },

    datetime: function (val) {
      const parsed = moment(val);
      if (!val) {
        return '';
      }
      if (!parsed.isValid()) {
        console.error('Cannot parse timestamp: %s', val);
        return '???';
      }
      return $('<div>')
        .attr({
          'data-toggle': 'tooltip',
          'data-placement': 'left',
          title: parsed.format(),
        })
        .text(_humanizeDate(val))
        .prop('outerHTML');
    },
  };

  return {
    formatters: formatters,
  };
})();
