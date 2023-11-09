require 'rails_helper'

RSpec.describe "Admins", type: :system do
  let!(:admin) { create(:admin) } 

  describe "GET admins#index" do
    context "一覧画面にアクセスしたとき" do
      before do
        visit admins_path
      end  
      
      it '表示リンクをクリックしたら詳細ページが正常に表示される' do
        click_link '表示'
        expect(page).to have_current_path(admin_path(admin))
        expect(page).to have_content(admin.email)
      end
    
      it '編集リンクをクリックしたら編集ページが正常に表示される' do
        click_link '編集'
        expect(page).to have_current_path(edit_admin_path(admin))
        expect(page).to have_selector 'h1', text: '管理者情報の編集'
      end
    
      it '削除リンクをクリックしたら管理者情報が正常に削除される' do
        accept_confirm do
          click_link '削除'
        end
        assert_no_text admin
      end

      it '新規作成リンクをクリックしたら新規作成ページが正常に表示される' do
        click_link '新規作成'
        expect(page).to have_current_path(new_admin_path)
        expect(page).to have_selector 'h1', text: '管理者新規作成'
      end
    end
  end

  describe "GET admins#new" do
    context "新規作成画面で管理者情報を作成したとき" do
      before do
        visit new_admin_path
      end  
      
      it '正常に作成された管理者情報が表示される' do
        fill_in 'Name', with: 'new'
        fill_in 'Email', with: 'new@xxx.com'
        fill_in 'Password', with: 'new_password'
        fill_in 'Password confirmation', with: 'new_password'
        click_button 'Create Admin'

        expect(page).to have_content('管理者情報を作成しました')

        newadmin = Admin.find_by(name: 'new')
        
        expect(page).to have_current_path(admin_path(newadmin))
        expect(page).to have_content('new')
        expect(page).to have_content('new@xxx.com')
      end
    end
  end

  describe "GET admins#edit" do
    context "編集画面で管理者情報を更新したとき" do
      before do
        visit edit_admin_path(admin)
      end  
      
      it '正常に更新された管理者情報が表示される' do
        fill_in 'Name', with: 'edit'
        fill_in 'Email', with: 'edit@xxx.com'
        click_button 'Update Admin'
        
        expect(page).to have_current_path(admin_path(admin))
        expect(page).to have_content('edit')
        expect(page).to have_content('edit@xxx.com')
      end
    end
  end
end
