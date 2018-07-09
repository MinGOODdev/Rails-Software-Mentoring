Rails.application.routes.draw do
  devise_for :users
  
  root 'home#index'
  get 'home/index'
  
  # 공지사항
  get 'notices/index'
  get 'notices/new'
  post 'notices/create'
  get 'notices/edit/:notice_id' => 'notices#edit'
  post 'notices/update/:notice_id' => 'notices#update'
  get 'notices/show/:notice_id' => 'notices#show'
  post 'notices/delete/:notice_id' => 'notices#delete'
  
  ## 멘토방 목록 조회
  get 'students/findAllRooms'
  
  ## 해당 멘토방 세부 정보 조회
  get 'students/findOneRoom/:mentor_room_id' => 'students#findOneRoom'
  
  ## 해당 멘토방 멘티로 신청
  post 'students/applyMentee/:mentor_room_id' => 'students#applyMentee'
  
  ## 해당 멘토방 멘티 신청 취소
  post 'students/deleteApplyMentee/:user_id' => 'students#deleteApplyMentee'
  
  ## 멘토 신청
  get 'students/applyMentorGet'
  post 'students/applyMentorPost'
  
  
  # 멘토가 사용하는 routes
  ## 내 멘토방 멘티 삭제
  post 'mentors/deleteMyMentee/:user_id' => 'mentors#deleteMyMentee'
  
  
  # 관리자가 사용하는 routes
  ## 모든 유저 목록
  get 'admin/findAllUsers'
  
  ## 멘토 신청한 유저 목록
  get 'admin/mentorApplyUsers'
  
  ## 멘토 신청자 승인 (신청자 권한 멘토로 변경)
  post 'admin/mentorApplyConfirm'
  
  ## 유저 권한 변경
  post 'admin/userAuthChange' => 'admin#userAuthChange'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
