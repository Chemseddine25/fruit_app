// استيراد المكتبات بشكل يتوافق مع الإصدارات الجديدة
import { createClient } from 'https://esm.sh/@supabase/supabase-js@2.39.7'

// استخدام النوع المناسب للـ Request لحل مشكلة 'any'
Deno.serve(async (req: Request) => {
  try {
    const { userId } = await req.json()

    const supabaseAdmin = createClient(
      Deno.env.get('SUPABASE_URL') ?? '',
      Deno.env.get('SUPABASE_SERVICE_ROLE_KEY') ?? '',
      {
        auth: {
          autoRefreshToken: false,
          persistSession: false
        }
      }
    )

    const { error } = await supabaseAdmin.auth.admin.deleteUser(userId)
    if (error) throw error

    return new Response(
      JSON.stringify({ message: 'User deleted' }),
      { status: 200, headers: { "Content-Type": "application/json" } }
    )

  } catch (error) {
    return new Response(
      JSON.stringify({ error: error.message }),
      { status: 500, headers: { "Content-Type": "application/json" } }
    )
  }
})