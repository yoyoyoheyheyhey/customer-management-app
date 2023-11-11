require 'rails_helper'

RSpec.describe "Customers", type: :system do
  let!(:customer) { create(:customer) } 

  describe "GET customers#index" do
    context "一覧画面にアクセスしたとき" do
      before do
        visit customers_path
      end  
      
      it '表示リンクをクリックしたら詳細ページが正常に表示される' do
        click_link '表示'
        expect(page).to have_current_path(customer_path(customer))
        expect(page).to have_content(customer.name)
        expect(page).to have_content(customer.phone_number)
        expect(page).to have_content(customer.remarks)
      end
    
      it '編集リンクをクリックしたら編集ページが正常に表示される' do
        click_link '編集'
        expect(page).to have_current_path(edit_customer_path(customer))
        expect(page).to have_selector 'h1', text: '顧客情報の編集'
      end
    
      it '削除リンクをクリックしたら顧客情報が正常に削除される' do
        accept_confirm do
          click_link '削除'
        end
        assert_no_text customer
      end

      it '新規作成リンクをクリックしたら新規作成ページが正常に表示される' do
        click_link '新規作成'
        expect(page).to have_current_path(new_customer_path)
        expect(page).to have_selector 'h1', text: '顧客新規作成'
      end
    end
  end

  describe "GET customers#new" do
    context "新規作成画面で顧客情報を作成したとき" do
      before do
        visit new_customer_path
      end  
      
      it '正常に作成された顧客情報が表示される' do
        fill_in 'Name', with: 'new'
        fill_in 'Phone number', with: '08099998888'
        fill_in 'Remarks', with: 'We are currently testing the system with capybara.'
        click_button 'Create Customer'

        expect(page).to have_content('顧客情報を作成しました')

        new_customer = Customer.find_by(name: 'new')
        
        expect(page).to have_current_path(customer_path(new_customer))
        expect(page).to have_content('new')
        expect(page).to have_content('08099998888')
        expect(page).to have_content('We are currently testing the system with capybara.')
      end
    end
  end

  describe "GET customers#edit" do
    context "編集画面で顧客情報を更新したとき" do
      before do
        visit edit_customer_path(customer)
      end  
      
      it '正常に更新された顧客情報が表示される' do
        fill_in 'Name', with: 'edit'
        fill_in 'Phone number', with: '09099997777'
        fill_in 'Remarks', with: 'Update customer information.'
        click_button 'Update Customer'
        
        expect(page).to have_current_path(customer_path(customer))
        expect(page).to have_content('edit')
        expect(page).to have_content('09099997777')
        expect(page).to have_content('Update customer information.')
      end
    end
  end
end