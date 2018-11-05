function result = highboost_filtering(img_filename, A)
filter = [-1,-1,-1;-1,A+7,-1;-1,-1,-1];
result = apply_LS_filter(img_filename, filter);
end