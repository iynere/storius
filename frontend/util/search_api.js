const search = query => (
  $.ajax({
    method: 'GET',
    url: 'api/searches',
    data: { query },
  })
);

export default search;
